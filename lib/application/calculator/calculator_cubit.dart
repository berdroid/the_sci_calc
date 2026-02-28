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
    final node = _findNode(state.expressionRoot, focusId);
    if (node == null) return;

    switch (node) {
      case PlaceholderNode(:final id):
        final newNode = ExpressionNode.number(id: id, raw: digit);
        final newRoot = _replaceNode(state.expressionRoot, id, newNode);
        emit(state.copyWith(
          expressionRoot: newRoot,
          lastResult: null,
          showingResult: false,
        ));

      case NumberNode(:final id, :final raw):
        if (digit == '.' && raw.contains('.')) return;
        final newRaw = raw == '0' && digit != '.' ? digit : raw + digit;
        final newNode = ExpressionNode.number(id: id, raw: newRaw);
        final newRoot = _replaceNode(state.expressionRoot, id, newNode);
        emit(state.copyWith(
          expressionRoot: newRoot,
          lastResult: null,
          showingResult: false,
        ));

      default:
        final placeholder = _firstPlaceholder(node);
        if (placeholder != null) {
          final newNode = ExpressionNode.number(
            id: placeholder.id,
            raw: digit,
          );
          final newRoot =
              _replaceNode(state.expressionRoot, placeholder.id, newNode);
          emit(state.copyWith(
            expressionRoot: newRoot,
            cursor: CursorPosition(focusedNodeId: placeholder.id),
            lastResult: null,
            showingResult: false,
          ));
        }
    }
  }

  void appendDecimalPoint() => appendDigit('.');

  // ── Binary operations ─────────────────────────────────────────────────────────

  void insertBinaryOp(OperatorType op) {
    final rightId = _newId();
    final newBinaryOp = ExpressionNode.binaryOp(
      id: _newId(),
      op: op,
      left: state.expressionRoot,
      right: ExpressionNode.placeholder(id: rightId),
    );
    emit(state.copyWith(
      expressionRoot: newBinaryOp,
      cursor: CursorPosition(focusedNodeId: rightId),
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Structured nodes ──────────────────────────────────────────────────────────

  void insertFraction() {
    final denominatorId = _newId();
    final newNode = ExpressionNode.fraction(
      id: _newId(),
      numerator: _focusedOrRoot(),
      denominator: ExpressionNode.placeholder(id: denominatorId),
    );
    _replaceRootWith(newNode, denominatorId);
  }

  void insertSquareRoot() {
    final radicandId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
    );
    _insertAtFocusedPlaceholder(newNode, radicandId);
  }

  void insertNthRoot() {
    final radicandId = _newId();
    final indexId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
      index: ExpressionNode.placeholder(id: indexId),
    );
    _insertAtFocusedPlaceholder(newNode, indexId);
  }

  void insertPower() {
    final exponentId = _newId();
    final newNode = ExpressionNode.power(
      id: _newId(),
      base: _focusedOrRoot(),
      exponent: ExpressionNode.placeholder(id: exponentId),
    );
    _replaceRootWith(newNode, exponentId);
  }

  void insertSquare() {
    final newNode = ExpressionNode.power(
      id: _newId(),
      base: _focusedOrRoot(),
      exponent: ExpressionNode.number(id: _newId(), raw: '2'),
    );
    final newId = newNode.id;
    _replaceRootWith(newNode, newId);
  }

  void insertReciprocal() {
    final newNode = ExpressionNode.fraction(
      id: _newId(),
      numerator: ExpressionNode.number(id: _newId(), raw: '1'),
      denominator: _focusedOrRoot(),
    );
    _replaceRootWith(newNode, newNode.id);
  }

  void insertTrigFunction(TrigFunctionType func) {
    final argId = _newId();
    final newNode = ExpressionNode.trigFunction(
      id: _newId(),
      func: func,
      argument: ExpressionNode.placeholder(id: argId),
    );
    _insertAtFocusedPlaceholder(newNode, argId);
  }

  void insertLogFunction(LogType logType) {
    final argId = _newId();
    final newNode = ExpressionNode.logFunction(
      id: _newId(),
      logType: logType,
      argument: ExpressionNode.placeholder(id: argId),
    );
    _insertAtFocusedPlaceholder(newNode, argId);
  }

  void insertAbsoluteValue() {
    final newNode = ExpressionNode.unaryOp(
      id: _newId(),
      op: UnaryOperatorType.absoluteValue,
      operand: _focusedOrRoot(),
    );
    _replaceRootWith(newNode, newNode.id);
  }

  void insertNegate() {
    final newNode = ExpressionNode.unaryOp(
      id: _newId(),
      op: UnaryOperatorType.negate,
      operand: _focusedOrRoot(),
    );
    _replaceRootWith(newNode, newNode.id);
  }

  void insertParentheses() {
    final newNode = ExpressionNode.parenthesized(
      id: _newId(),
      inner: _focusedOrRoot(),
    );
    _replaceRootWith(newNode, newNode.id);
  }

  void insertConstant(ConstantType constant) {
    final focusId = state.cursor.focusedNodeId;
    final newNode = ExpressionNode.constant(id: focusId, constant: constant);
    final newRoot = _replaceNode(state.expressionRoot, focusId, newNode);
    emit(state.copyWith(
      expressionRoot: newRoot,
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Delete / clear ────────────────────────────────────────────────────────────

  void deleteAtCursor() {
    final focusId = state.cursor.focusedNodeId;
    final node = _findNode(state.expressionRoot, focusId);
    if (node == null) return;

    switch (node) {
      case NumberNode(:final id, :final raw):
        if (raw.length > 1) {
          final newNode = ExpressionNode.number(
            id: id,
            raw: raw.substring(0, raw.length - 1),
          );
          emit(state.copyWith(
            expressionRoot: _replaceNode(state.expressionRoot, id, newNode),
            lastResult: null,
            showingResult: false,
          ));
        } else {
          final placeholder = ExpressionNode.placeholder(id: id);
          emit(state.copyWith(
            expressionRoot: _replaceNode(state.expressionRoot, id, placeholder),
            lastResult: null,
            showingResult: false,
          ));
        }

      case PlaceholderNode():
        final parent = _findParent(state.expressionRoot, focusId);
        if (parent != null) {
          final newId = _newId();
          final placeholder = ExpressionNode.placeholder(id: newId);
          emit(state.copyWith(
            expressionRoot:
                _replaceNode(state.expressionRoot, parent.id, placeholder),
            cursor: CursorPosition(focusedNodeId: newId),
            lastResult: null,
            showingResult: false,
          ));
        }

      default:
        final newId = _newId();
        final placeholder = ExpressionNode.placeholder(id: newId);
        emit(state.copyWith(
          expressionRoot:
              _replaceNode(state.expressionRoot, focusId, placeholder),
          cursor: CursorPosition(focusedNodeId: newId),
          lastResult: null,
          showingResult: false,
        ));
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
    final leaves = _allLeaves(state.expressionRoot);
    final idx =
        leaves.indexWhere((n) => n.id == state.cursor.focusedNodeId);
    if (idx > 0) {
      emit(state.copyWith(
        cursor: CursorPosition(focusedNodeId: leaves[idx - 1].id),
      ));
    }
  }

  void moveCursorRight() {
    final leaves = _allLeaves(state.expressionRoot);
    final idx =
        leaves.indexWhere((n) => n.id == state.cursor.focusedNodeId);
    if (idx >= 0 && idx < leaves.length - 1) {
      emit(state.copyWith(
        cursor: CursorPosition(focusedNodeId: leaves[idx + 1].id),
      ));
    }
  }

  void focusNode(NodeId id) {
    emit(state.copyWith(cursor: CursorPosition(focusedNodeId: id)));
  }

  // ── Evaluate ──────────────────────────────────────────────────────────────────

  void evaluate() {
    final result = _evaluator.evaluate(
      state.expressionRoot,
      state.angleUnit,
    );
    emit(state.copyWith(
      lastResult: result,
      showingResult: true,
    ));
  }

  // ── Settings sync ─────────────────────────────────────────────────────────────

  void setAngleUnit(AngleUnit unit) {
    emit(state.copyWith(angleUnit: unit));
  }

  void setDisplayFormat(DisplayFormat fmt) {
    emit(state.copyWith(displayFormat: fmt));
  }

  void loadExpression(ExpressionNode root) {
    final leaves = _allLeaves(root);
    final firstId = leaves.isNotEmpty ? leaves.first.id : root.id;
    emit(state.copyWith(
      expressionRoot: root,
      cursor: CursorPosition(focusedNodeId: firstId),
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Private helpers ───────────────────────────────────────────────────────────

  /// Returns the focused leaf node, or the whole expression root if focus is
  /// on a non-leaf or the focused node is the root.
  ExpressionNode _focusedOrRoot() {
    final focusId = state.cursor.focusedNodeId;
    return _findNode(state.expressionRoot, focusId) ?? state.expressionRoot;
  }

  /// Insert [newNode] in place of the currently-focused placeholder.
  /// If focus is not on a placeholder, replace the root.
  void _insertAtFocusedPlaceholder(ExpressionNode newNode, NodeId cursorId) {
    final focusId = state.cursor.focusedNodeId;
    final focused = _findNode(state.expressionRoot, focusId);
    final newRoot = focused is PlaceholderNode
        ? _replaceNode(state.expressionRoot, focusId, newNode)
        : newNode;
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: CursorPosition(focusedNodeId: cursorId),
      lastResult: null,
      showingResult: false,
    ));
  }

  /// Replace the root with [newNode] and move cursor to [cursorId].
  void _replaceRootWith(ExpressionNode newNode, NodeId cursorId) {
    emit(state.copyWith(
      expressionRoot: newNode,
      cursor: CursorPosition(focusedNodeId: cursorId),
      lastResult: null,
      showingResult: false,
    ));
  }

  /// Find a node by ID in the tree.
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

  /// Replace a node by ID throughout the tree.
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
          index: index != null
              ? _replaceNode(index, targetId, replacement)
              : null,
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
          base: base != null
              ? _replaceNode(base, targetId, replacement)
              : null,
        ),
      ParenthesizedNode(:final id, :final inner) =>
        ExpressionNode.parenthesized(
          id: id,
          inner: _replaceNode(inner, targetId, replacement),
        ),
    };
  }

  /// Find the direct parent of the node with [childId].
  ExpressionNode? _findParent(ExpressionNode root, NodeId childId) {
    bool isDirectChild(ExpressionNode parent) {
      return switch (parent) {
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
    }

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

  /// All leaf nodes (NumberNode, PlaceholderNode, ConstantNode) in order.
  List<ExpressionNode> _allLeaves(ExpressionNode root) {
    return switch (root) {
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
  }

  PlaceholderNode? _firstPlaceholder(ExpressionNode node) {
    if (node is PlaceholderNode) return node;
    for (final child in _directChildren(node)) {
      final found = _firstPlaceholder(child);
      if (found != null) return found;
    }
    return null;
  }
}
