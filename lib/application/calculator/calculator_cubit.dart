import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/cursor_position.dart';
import '../../domain/entities/expression_node.dart';
import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';
import '../../infrastructure/evaluation/expression_evaluator.dart';
import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit(this._evaluator)
      : super(CalculatorState(
          expressionRoot: _makeInitialRoot(),
          cursor: CursorPosition(focusedNodeId: _lastId),
        ));

  final ExpressionEvaluator _evaluator;
  static const _uuid = Uuid();
  static String _lastId = '';

  static ExpressionNode _makeInitialRoot() {
    _lastId = _uuid.v4();
    return ExpressionNode.placeholder(id: _lastId);
  }

  static String _newId() => _uuid.v4();

  // ── Digit input ──────────────────────────────────────────────────────────────

  void appendDigit(String digit) {
    final focusId = state.cursor.focusedNodeId;
    final k = state.cursor.charOffset;
    final node = _findNode(state.expressionRoot, focusId);
    if (node == null) return;

    switch (node) {
      case PlaceholderNode(:final id):
        final newNode = ExpressionNode.number(id: id, raw: digit);
        _emitReplaced(id, newNode, CursorPosition(focusedNodeId: id, charOffset: 1));

      case NumberNode(:final id, :final raw):
        if (digit == '.' && raw.contains('.')) return;
        final pos = k.clamp(0, raw.length);
        // Replace a lone '0' only when cursor is at its end.
        final (newRaw, newOffset) = (raw == '0' && digit != '.' && pos == 1)
            ? (digit, 1)
            : ('${raw.substring(0, pos)}$digit${raw.substring(pos)}', pos + 1);
        _emitReplaced(id, ExpressionNode.number(id: id, raw: newRaw),
            CursorPosition(focusedNodeId: id, charOffset: newOffset));

      default:
        final placeholder = _firstPlaceholder(node);
        if (placeholder != null) {
          _emitReplaced(
            placeholder.id,
            ExpressionNode.number(id: placeholder.id, raw: digit),
            CursorPosition(focusedNodeId: placeholder.id, charOffset: 1),
          );
        }
    }
  }

  void appendDecimalPoint() => appendDigit('.');

  // ── Binary operations ─────────────────────────────────────────────────────────
  //
  // Binary operators are inserted *within the current scope*. The scope root is
  // the largest sub-expression that is still inside the nearest containing
  // structural slot (trig argument, root radicand, fraction slot, etc.).
  // BinaryOpNodes are transparent to scope — only structural nodes create
  // scope boundaries. The scope root becomes the left operand of the new op.

  void insertBinaryOp(OperatorType op) {
    final rightId = _newId();
    _insertWrappingScope(
      (scope) => ExpressionNode.binaryOp(
        id: _newId(),
        op: op,
        left: scope,
        right: ExpressionNode.placeholder(id: rightId),
      ),
      CursorPosition(focusedNodeId: rightId),
    );
  }

  // ── Structured nodes ──────────────────────────────────────────────────────────

  void insertFraction() {
    final denominatorId = _newId();
    _insertWrappingScope(
      (scope) => ExpressionNode.fraction(
        id: _newId(),
        numerator: scope,
        denominator: ExpressionNode.placeholder(id: denominatorId),
      ),
      CursorPosition(focusedNodeId: denominatorId),
    );
  }

  void insertSquareRoot() {
    final radicandId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
    );
    _insertAtFocusedPlaceholder(newNode, CursorPosition(focusedNodeId: radicandId));
  }

  void insertNthRoot() {
    final radicandId = _newId();
    final indexId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
      index: ExpressionNode.placeholder(id: indexId),
    );
    _insertAtFocusedPlaceholder(newNode, CursorPosition(focusedNodeId: indexId));
  }

  void insertPower() {
    final exponentId = _newId();
    _insertWrappingScope(
      (scope) => ExpressionNode.power(
        id: _newId(),
        base: scope,
        exponent: ExpressionNode.placeholder(id: exponentId),
      ),
      CursorPosition(focusedNodeId: exponentId),
    );
  }

  void insertSquare() {
    _insertWrappingScope(
      (scope) => ExpressionNode.power(
        id: _newId(),
        base: scope,
        exponent: ExpressionNode.number(id: _newId(), raw: '2'),
      ),
      state.cursor, // cursor stays at same position inside the base
    );
  }

  void insertReciprocal() {
    _insertWrappingScope(
      (scope) => ExpressionNode.fraction(
        id: _newId(),
        numerator: ExpressionNode.number(id: _newId(), raw: '1'),
        denominator: scope,
      ),
      state.cursor, // cursor stays at same position inside the denominator
    );
  }

  void insertTrigFunction(TrigFunctionType func) {
    final argId = _newId();
    final newNode = ExpressionNode.trigFunction(
      id: _newId(),
      func: func,
      argument: ExpressionNode.placeholder(id: argId),
    );
    _insertAtFocusedPlaceholder(newNode, CursorPosition(focusedNodeId: argId));
  }

  void insertLogFunction(LogType logType) {
    final argId = _newId();
    final newNode = ExpressionNode.logFunction(
      id: _newId(),
      logType: logType,
      argument: ExpressionNode.placeholder(id: argId),
    );
    _insertAtFocusedPlaceholder(newNode, CursorPosition(focusedNodeId: argId));
  }

  void insertAbsoluteValue() {
    _insertWrappingScope(
      (scope) => ExpressionNode.unaryOp(
        id: _newId(),
        op: UnaryOperatorType.absoluteValue,
        operand: scope,
      ),
      state.cursor,
    );
  }

  void insertNegate() {
    _insertWrappingScope(
      (scope) => ExpressionNode.unaryOp(
        id: _newId(),
        op: UnaryOperatorType.negate,
        operand: scope,
      ),
      state.cursor,
    );
  }

  void insertParentheses() {
    _insertWrappingScope(
      (scope) => ExpressionNode.parenthesized(
        id: _newId(),
        inner: scope,
      ),
      state.cursor,
    );
  }

  void insertConstant(ConstantType constant) {
    final focusId = state.cursor.focusedNodeId;
    final newNode = ExpressionNode.constant(id: focusId, constant: constant);
    _emitReplaced(focusId, newNode,
        CursorPosition(focusedNodeId: focusId, charOffset: 1));
  }

  // ── Delete / clear ────────────────────────────────────────────────────────────

  void deleteAtCursor() {
    final focusId = state.cursor.focusedNodeId;
    final k = state.cursor.charOffset;
    final node = _findNode(state.expressionRoot, focusId);
    if (node == null) return;

    switch (node) {
      case NumberNode(:final id, :final raw):
        if (k == 0) return; // nothing to the left of the cursor
        final newRaw = '${raw.substring(0, k - 1)}${raw.substring(k)}';
        if (newRaw.isEmpty) {
          _emitReplaced(id, ExpressionNode.placeholder(id: id),
              CursorPosition(focusedNodeId: id));
        } else {
          _emitReplaced(id, ExpressionNode.number(id: id, raw: newRaw),
              CursorPosition(focusedNodeId: id, charOffset: k - 1));
        }

      case PlaceholderNode():
        final parent = _findParent(state.expressionRoot, focusId);
        if (parent != null) {
          final newId = _newId();
          _emitReplaced(parent.id, ExpressionNode.placeholder(id: newId),
              CursorPosition(focusedNodeId: newId));
        }

      default:
        final newId = _newId();
        _emitReplaced(focusId, ExpressionNode.placeholder(id: newId),
            CursorPosition(focusedNodeId: newId));
    }
  }

  void clear() {
    final newId = _newId();
    emit(state.copyWith(
      expressionRoot: ExpressionNode.placeholder(id: newId),
      cursor: CursorPosition(focusedNodeId: newId),
      selection: null,
      lastResult: null,
      showingResult: false,
    ));
  }

  void clearResult() {
    emit(state.copyWith(showingResult: false, lastResult: null));
  }

  // ── Cursor navigation ─────────────────────────────────────────────────────────

  void moveCursorLeft() {
    final positions = _allNavigablePositions(state.expressionRoot);
    final idx = positions.indexWhere((p) => p == state.cursor);
    if (idx > 0) {
      emit(state.copyWith(cursor: positions[idx - 1]));
    }
  }

  void moveCursorRight() {
    final positions = _allNavigablePositions(state.expressionRoot);
    final idx = positions.indexWhere((p) => p == state.cursor);
    if (idx >= 0 && idx < positions.length - 1) {
      emit(state.copyWith(cursor: positions[idx + 1]));
    }
  }

  void focusNode(NodeId id) {
    // Tapping a node places the cursor at its natural "after" position.
    final node = _findNode(state.expressionRoot, id);
    final offset = switch (node) {
      NumberNode(:final raw) => raw.length,
      PlaceholderNode() || null => 0,
      _ => 1, // constant → after; structural → exit
    };
    emit(state.copyWith(
        cursor: CursorPosition(focusedNodeId: id, charOffset: offset)));
  }

  // ── Evaluate ──────────────────────────────────────────────────────────────────

  void evaluate() {
    final result = _evaluator.evaluate(state.expressionRoot, state.angleUnit);
    emit(state.copyWith(lastResult: result, showingResult: true));
  }

  // ── Settings sync ─────────────────────────────────────────────────────────────

  void setAngleUnit(AngleUnit unit) => emit(state.copyWith(angleUnit: unit));

  void setDisplayFormat(DisplayFormat fmt) =>
      emit(state.copyWith(displayFormat: fmt));

  void loadExpression(ExpressionNode root) {
    final leaves = _allLeaves(root);
    final first = leaves.isNotEmpty ? leaves.first : root;
    final offset = switch (first) {
      NumberNode(:final raw) => raw.length,
      _ => 0,
    };
    emit(state.copyWith(
      expressionRoot: root,
      cursor: CursorPosition(focusedNodeId: first.id, charOffset: offset),
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Scope helpers ─────────────────────────────────────────────────────────────

  /// Returns the path of nodes from [root] down to the node with [targetId],
  /// inclusive. Returns null if [targetId] is not found.
  List<ExpressionNode>? _pathToNode(ExpressionNode root, NodeId targetId) {
    if (root.id == targetId) return [root];
    for (final child in _directChildren(root)) {
      final sub = _pathToNode(child, targetId);
      if (sub != null) return [root, ...sub];
    }
    return null;
  }

  /// The **scope root** is the largest sub-expression that can be edited
  /// without leaving the current structural slot.
  ///
  /// Walking upward from the focused node: [BinaryOpNode]s are transparent
  /// (they are part of the expression being built inside the slot). Any other
  /// structural node (Trig, Log, Root, Fraction, Power, Paren, Unary) is a
  /// scope boundary; the child of that node that contains the focus becomes
  /// the scope root.
  ExpressionNode _findScopeRoot(ExpressionNode globalRoot, NodeId focusId) {
    final path = _pathToNode(globalRoot, focusId);
    if (path == null) return globalRoot;
    for (int i = path.length - 1; i >= 1; i--) {
      if (path[i - 1] is! BinaryOpNode) {
        return path[i]; // first non-BinaryOp boundary found — child is scope root
      }
    }
    return globalRoot; // only BinaryOpNodes above — scope is global root
  }

  /// Wraps the current scope root with a node built by [builder], then moves
  /// the cursor to [newCursor]. The scope root is replaced in-place within the
  /// global tree.
  void _insertWrappingScope(
    ExpressionNode Function(ExpressionNode scopeRoot) builder,
    CursorPosition newCursor,
  ) {
    final scopeRoot =
        _findScopeRoot(state.expressionRoot, state.cursor.focusedNodeId);
    final newNode = builder(scopeRoot);
    final newRoot = scopeRoot.id == state.expressionRoot.id
        ? newNode
        : _replaceNode(state.expressionRoot, scopeRoot.id, newNode);
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: newCursor,
      lastResult: null,
      showingResult: false,
    ));
  }

  /// Inserts [newNode] in place of the currently-focused [PlaceholderNode].
  /// If the focused node is not a placeholder, replaces the global root
  /// (fallback for function keys pressed outside a placeholder).
  void _insertAtFocusedPlaceholder(
      ExpressionNode newNode, CursorPosition newCursor) {
    final focusId = state.cursor.focusedNodeId;
    final focused = _findNode(state.expressionRoot, focusId);
    final newRoot = focused is PlaceholderNode
        ? _replaceNode(state.expressionRoot, focusId, newNode)
        : newNode;
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: newCursor,
      lastResult: null,
      showingResult: false,
    ));
  }

  /// Replaces the node with [targetId] in the global tree and emits a new
  /// state with the given [cursor].
  void _emitReplaced(
      NodeId targetId, ExpressionNode replacement, CursorPosition cursor) {
    final newRoot = _replaceNode(state.expressionRoot, targetId, replacement);
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: cursor,
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Tree utilities ────────────────────────────────────────────────────────────

  ExpressionNode? _findNode(ExpressionNode root, NodeId targetId) {
    if (root.id == targetId) return root;
    return switch (root) {
      PlaceholderNode() || NumberNode() || ConstantNode() => null,
      BinaryOpNode(:final left, :final right) =>
        _findNode(left, targetId) ?? _findNode(right, targetId),
      UnaryOpNode(:final operand) => _findNode(operand, targetId),
      FractionNode(:final numerator, :final denominator) =>
        _findNode(numerator, targetId) ?? _findNode(denominator, targetId),
      RootNode(:final radicand, :final index) =>
        _findNode(radicand, targetId) ??
            (index != null ? _findNode(index, targetId) : null),
      PowerNode(:final base, :final exponent) =>
        _findNode(base, targetId) ?? _findNode(exponent, targetId),
      TrigFunctionNode(:final argument) => _findNode(argument, targetId),
      LogFunctionNode(:final argument, :final base) =>
        _findNode(argument, targetId) ??
            (base != null ? _findNode(base, targetId) : null),
      ParenthesizedNode(:final inner) => _findNode(inner, targetId),
    };
  }

  ExpressionNode _replaceNode(
    ExpressionNode root,
    NodeId targetId,
    ExpressionNode replacement,
  ) {
    if (root.id == targetId) return replacement;
    return switch (root) {
      PlaceholderNode() || NumberNode() || ConstantNode() => root,
      BinaryOpNode(:final id, :final op, :final left, :final right) =>
        ExpressionNode.binaryOp(
          id: id,
          op: op,
          left: _replaceNode(left, targetId, replacement),
          right: _replaceNode(right, targetId, replacement),
        ),
      UnaryOpNode(:final id, :final op, :final operand) =>
        ExpressionNode.unaryOp(
          id: id,
          op: op,
          operand: _replaceNode(operand, targetId, replacement),
        ),
      FractionNode(:final id, :final numerator, :final denominator) =>
        ExpressionNode.fraction(
          id: id,
          numerator: _replaceNode(numerator, targetId, replacement),
          denominator: _replaceNode(denominator, targetId, replacement),
        ),
      RootNode(:final id, :final radicand, :final index) =>
        ExpressionNode.root(
          id: id,
          radicand: _replaceNode(radicand, targetId, replacement),
          index:
              index != null ? _replaceNode(index, targetId, replacement) : null,
        ),
      PowerNode(:final id, :final base, :final exponent) =>
        ExpressionNode.power(
          id: id,
          base: _replaceNode(base, targetId, replacement),
          exponent: _replaceNode(exponent, targetId, replacement),
        ),
      TrigFunctionNode(:final id, :final func, :final argument) =>
        ExpressionNode.trigFunction(
          id: id,
          func: func,
          argument: _replaceNode(argument, targetId, replacement),
        ),
      LogFunctionNode(:final id, :final logType, :final argument, :final base) =>
        ExpressionNode.logFunction(
          id: id,
          logType: logType,
          argument: _replaceNode(argument, targetId, replacement),
          base: base != null ? _replaceNode(base, targetId, replacement) : null,
        ),
      ParenthesizedNode(:final id, :final inner) =>
        ExpressionNode.parenthesized(
          id: id,
          inner: _replaceNode(inner, targetId, replacement),
        ),
    };
  }

  ExpressionNode? _findParent(ExpressionNode root, NodeId childId) {
    bool isDirectChild(ExpressionNode parent) => switch (parent) {
          BinaryOpNode(:final left, :final right) =>
            left.id == childId || right.id == childId,
          UnaryOpNode(:final operand) => operand.id == childId,
          FractionNode(:final numerator, :final denominator) =>
            numerator.id == childId || denominator.id == childId,
          RootNode(:final radicand, :final index) =>
            radicand.id == childId || index?.id == childId,
          PowerNode(:final base, :final exponent) =>
            base.id == childId || exponent.id == childId,
          TrigFunctionNode(:final argument) => argument.id == childId,
          LogFunctionNode(:final argument, :final base) =>
            argument.id == childId || base?.id == childId,
          ParenthesizedNode(:final inner) => inner.id == childId,
          _ => false,
        };

    if (isDirectChild(root)) return root;
    for (final child in _directChildren(root)) {
      final found = _findParent(child, childId);
      if (found != null) return found;
    }
    return null;
  }

  List<ExpressionNode> _directChildren(ExpressionNode node) => switch (node) {
        BinaryOpNode(:final left, :final right) => [left, right],
        UnaryOpNode(:final operand) => [operand],
        FractionNode(:final numerator, :final denominator) => [
            numerator,
            denominator,
          ],
        RootNode(:final radicand, :final index) =>
          index != null ? [radicand, index] : [radicand],
        PowerNode(:final base, :final exponent) => [base, exponent],
        TrigFunctionNode(:final argument) => [argument],
        LogFunctionNode(:final argument, :final base) =>
          base != null ? [argument, base] : [argument],
        ParenthesizedNode(:final inner) => [inner],
        _ => <ExpressionNode>[],
      };

  /// All cursor positions in left-to-right reading order.
  ///
  /// - [PlaceholderNode]: one position (charOffset 0, caret inside box).
  /// - [NumberNode] with `n` characters: `n+1` positions (charOffset 0…n),
  ///   one between each pair of adjacent characters plus before and after.
  /// - [ConstantNode]: two positions (charOffset 0 = before, 1 = after).
  /// - [BinaryOpNode]: transparent — only its children's positions.
  /// - All other structural nodes: entry position (charOffset 0, caret before
  ///   the rendered widget), children's positions, exit position (charOffset 1,
  ///   caret after the rendered widget).
  List<CursorPosition> _allNavigablePositions(ExpressionNode root) =>
      switch (root) {
        PlaceholderNode(:final id) => [CursorPosition(focusedNodeId: id)],
        NumberNode(:final id, :final raw) => List.generate(
            raw.length + 1,
            (k) => CursorPosition(focusedNodeId: id, charOffset: k),
          ),
        ConstantNode(:final id) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        BinaryOpNode(:final left, :final right) => [
            ..._allNavigablePositions(left),
            ..._allNavigablePositions(right),
          ],
        UnaryOpNode(:final id, :final operand) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ..._allNavigablePositions(operand),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        FractionNode(:final id, :final numerator, :final denominator) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ..._allNavigablePositions(numerator),
            ..._allNavigablePositions(denominator),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        RootNode(:final id, :final radicand, :final index) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ...(index != null
                ? _allNavigablePositions(index)
                : <CursorPosition>[]),
            ..._allNavigablePositions(radicand),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        PowerNode(:final id, :final base, :final exponent) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ..._allNavigablePositions(base),
            ..._allNavigablePositions(exponent),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        TrigFunctionNode(:final id, :final argument) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ..._allNavigablePositions(argument),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        LogFunctionNode(:final id, :final argument, :final base) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ...(base != null
                ? _allNavigablePositions(base)
                : <CursorPosition>[]),
            ..._allNavigablePositions(argument),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
        ParenthesizedNode(:final id, :final inner) => [
            CursorPosition(focusedNodeId: id, charOffset: 0),
            ..._allNavigablePositions(inner),
            CursorPosition(focusedNodeId: id, charOffset: 1),
          ],
      };

  List<ExpressionNode> _allLeaves(ExpressionNode root) => switch (root) {
        PlaceholderNode() || NumberNode() || ConstantNode() => [root],
        BinaryOpNode(:final left, :final right) => [
            ..._allLeaves(left),
            ..._allLeaves(right),
          ],
        UnaryOpNode(:final operand) => _allLeaves(operand),
        FractionNode(:final numerator, :final denominator) => [
            ..._allLeaves(numerator),
            ..._allLeaves(denominator),
          ],
        RootNode(:final radicand, :final index) => [
            ...(index != null ? _allLeaves(index) : <ExpressionNode>[]),
            ..._allLeaves(radicand),
          ],
        PowerNode(:final base, :final exponent) => [
            ..._allLeaves(base),
            ..._allLeaves(exponent),
          ],
        TrigFunctionNode(:final argument) => _allLeaves(argument),
        LogFunctionNode(:final argument, :final base) => [
            ...(base != null ? _allLeaves(base) : <ExpressionNode>[]),
            ..._allLeaves(argument),
          ],
        ParenthesizedNode(:final inner) => _allLeaves(inner),
      };

  PlaceholderNode? _firstPlaceholder(ExpressionNode node) {
    if (node is PlaceholderNode) return node;
    for (final child in _directChildren(node)) {
      final found = _firstPlaceholder(child);
      if (found != null) return found;
    }
    return null;
  }
}
