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

    // At the entry position (charOffset==0) of a structural or constant node,
    // auto-insert an implicit multiply: digit × scope.
    if (k == 0 && digit != '.' && node is! NumberNode && node is! PlaceholderNode) {
      final numId = _newId();
      final scopeRoot =
          _findScopeRoot(state.expressionRoot, focusId);
      final newExpr = ExpressionNode.binaryOp(
        id: _newId(),
        op: OperatorType.multiply,
        left: ExpressionNode.number(id: numId, raw: digit),
        right: scopeRoot,
      );
      final newRoot = scopeRoot.id == state.expressionRoot.id
          ? newExpr
          : _replaceNode(state.expressionRoot, scopeRoot.id, newExpr);
      emit(state.copyWith(
        expressionRoot: newRoot,
        cursor: CursorPosition(focusedNodeId: numId, charOffset: 1),
        lastResult: null,
        showingResult: false,
      ));
      return;
    }

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
    final node = _findNode(state.expressionRoot, state.cursor.focusedNodeId);
    if (node == null) return;

    // At the entry position (charOffset==0) of a structural or constant node,
    // the scope becomes the RIGHT operand: □ op scope.
    if (state.cursor.charOffset == 0 &&
        node is! NumberNode &&
        node is! PlaceholderNode) {
      final leftId = _newId();
      final scopeRoot =
          _findScopeRoot(state.expressionRoot, state.cursor.focusedNodeId);
      final newBinOp = ExpressionNode.binaryOp(
        id: _newId(),
        op: op,
        left: ExpressionNode.placeholder(id: leftId),
        right: scopeRoot,
      );
      final newRoot = scopeRoot.id == state.expressionRoot.id
          ? newBinOp
          : _replaceNode(state.expressionRoot, scopeRoot.id, newBinOp);
      emit(state.copyWith(
        expressionRoot: newRoot,
        cursor: CursorPosition(focusedNodeId: leftId),
        lastResult: null,
        showingResult: false,
      ));
      return;
    }

    // Default: scope becomes LEFT operand, new placeholder is RIGHT.
    // Use precedence-aware scope finding so that "4+3×□" inserts × after 3
    // only, not after the entire "4+3".
    final rightId = _newId();
    final scope = _findScopeRootForBinaryOp(
        state.expressionRoot, state.cursor.focusedNodeId, op);
    final newNode = ExpressionNode.binaryOp(
      id: _newId(),
      op: op,
      left: scope,
      right: ExpressionNode.placeholder(id: rightId),
    );
    final newRoot = scope.id == state.expressionRoot.id
        ? newNode
        : _replaceNode(state.expressionRoot, scope.id, newNode);
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: CursorPosition(focusedNodeId: rightId),
      lastResult: null,
      showingResult: false,
    ));
  }

  // ── Structured nodes ──────────────────────────────────────────────────────────

  void insertFraction() {
    final denominatorId = _newId();
    final scope = _findScopeRoot(state.expressionRoot, state.cursor.focusedNodeId);
    // If the numerator slot is still empty, start there; if it was a filled
    // expression that got wrapped, move straight to the denominator.
    final newCursor = scope is PlaceholderNode
        ? CursorPosition(focusedNodeId: scope.id)
        : CursorPosition(focusedNodeId: denominatorId);
    _insertWrappingScope(
      (s) => ExpressionNode.fraction(
        id: _newId(),
        numerator: s,
        denominator: ExpressionNode.placeholder(id: denominatorId),
      ),
      newCursor,
    );
  }

  void insertSquareRoot() {
    final radicandId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
    );
    _insertWithImplicitMultiply(newNode, CursorPosition(focusedNodeId: radicandId));
  }

  void insertNthRoot() {
    final radicandId = _newId();
    final indexId = _newId();
    final newNode = ExpressionNode.root(
      id: _newId(),
      radicand: ExpressionNode.placeholder(id: radicandId),
      index: ExpressionNode.placeholder(id: indexId),
    );
    _insertWithImplicitMultiply(newNode, CursorPosition(focusedNodeId: indexId));
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
    _insertWithImplicitMultiply(newNode, CursorPosition(focusedNodeId: argId));
  }

  void insertLogFunction(LogType logType) {
    final argId = _newId();
    final newNode = ExpressionNode.logFunction(
      id: _newId(),
      logType: logType,
      argument: ExpressionNode.placeholder(id: argId),
    );
    _insertWithImplicitMultiply(newNode, CursorPosition(focusedNodeId: argId));
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
    final innerId = _newId();
    final newNode = ExpressionNode.parenthesized(
      id: _newId(),
      inner: ExpressionNode.placeholder(id: innerId),
    );
    _insertWithImplicitMultiply(newNode, CursorPosition(focusedNodeId: innerId));
  }

  void insertConstant(ConstantType constant) {
    final focusId = state.cursor.focusedNodeId;
    final k = state.cursor.charOffset;
    final node = _findNode(state.expressionRoot, focusId);

    // At the exit of a number or constant, auto-insert an implicit multiply:
    // e.g. "2" + π  →  2 × π,  and  π + e  →  π × e.
    final atExit = switch (node) {
      NumberNode(:final raw) => k == raw.length,
      ConstantNode() => k == 1,
      _ => false,
    };

    if (atExit) {
      final constId = _newId();
      final newConst = ExpressionNode.constant(id: constId, constant: constant);
      _emitReplaced(
        focusId,
        ExpressionNode.binaryOp(
          id: _newId(),
          op: OperatorType.multiply,
          left: node!,
          right: newConst,
        ),
        CursorPosition(focusedNodeId: constId, charOffset: 1),
      );
      return;
    }

    // Default: replace the focused node (typically a placeholder) with the constant.
    _emitReplaced(focusId, ExpressionNode.constant(id: focusId, constant: constant),
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
        if (k == 0) {
          // Nothing inside the number to the left; remove the preceding
          // binary operator (if this number is the right operand of one).
          _deleteLeftOperator(id);
          return;
        }
        final newRaw = '${raw.substring(0, k - 1)}${raw.substring(k)}';
        if (newRaw.isEmpty) {
          _emitReplaced(id, ExpressionNode.placeholder(id: id),
              CursorPosition(focusedNodeId: id));
        } else {
          _emitReplaced(id, ExpressionNode.number(id: id, raw: newRaw),
              CursorPosition(focusedNodeId: id, charOffset: k - 1));
        }

      case PlaceholderNode(:final id):
        final parent = _findParent(state.expressionRoot, id);
        if (parent == null) return; // root placeholder — nothing to delete
        if (parent is BinaryOpNode) {
          if (parent.right.id == id) {
            // Placeholder is the right operand: remove the operator and
            // placeholder, keeping the left child.
            _collapseToChild(parent, parent.left);
          }
          // Placeholder is the left operand: cursor is already at the
          // leftmost position of the binary expression — no-op.
        } else {
          // Structural parent (trig, root, fraction, etc.): remove the
          // parent node and replace with a plain placeholder.
          final newId = _newId();
          _emitReplaced(parent.id, ExpressionNode.placeholder(id: newId),
              CursorPosition(focusedNodeId: newId));
        }

      default:
        if (k == 0) {
          // Entry position: nothing inside this node is to the left of the
          // cursor. Remove the preceding binary operator (if any).
          _deleteLeftOperator(focusId);
        } else {
          // Exit position (k == 1): the node itself is the entity immediately
          // to the left of the cursor — replace it with a placeholder.
          final newId = _newId();
          _emitReplaced(focusId, ExpressionNode.placeholder(id: newId),
              CursorPosition(focusedNodeId: newId));
        }
    }
  }

  /// If [nodeId] is the direct right child of a [BinaryOpNode], removes the
  /// operator and left operand, keeping the right child. The cursor stays at
  /// the first position of the right child (where it already was).
  /// Otherwise a no-op.
  void _deleteLeftOperator(NodeId nodeId) {
    final parent = _findParent(state.expressionRoot, nodeId);
    if (parent is BinaryOpNode && parent.right.id == nodeId) {
      final keepNode = parent.right;
      final newRoot = parent.id == state.expressionRoot.id
          ? keepNode
          : _replaceNode(state.expressionRoot, parent.id, keepNode);
      final positions = _allNavigablePositions(keepNode);
      final newCursor = positions.isNotEmpty
          ? positions.first
          : CursorPosition(focusedNodeId: keepNode.id);
      emit(state.copyWith(
        expressionRoot: newRoot,
        cursor: newCursor,
        lastResult: null,
        showingResult: false,
      ));
    }
  }

  /// Replaces [binOp] in the expression tree with [keepChild] and moves
  /// the cursor to the last navigable position within [keepChild].
  /// Used when the right operand is a placeholder: removes the operator and
  /// placeholder, keeping the left child with cursor at its end.
  void _collapseToChild(BinaryOpNode binOp, ExpressionNode keepChild) {
    final newRoot = binOp.id == state.expressionRoot.id
        ? keepChild
        : _replaceNode(state.expressionRoot, binOp.id, keepChild);
    final positions = _allNavigablePositions(keepChild);
    final newCursor = positions.isNotEmpty
        ? positions.last
        : CursorPosition(focusedNodeId: keepChild.id);
    emit(state.copyWith(
      expressionRoot: newRoot,
      cursor: newCursor,
      lastResult: null,
      showingResult: false,
    ));
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
  /// Walking upward from the focused node: [BinaryOpNode]s and
  /// [UnaryOpNode(negate)] are transparent — they are part of the expression
  /// being built at the same level, so a binary operator inserted here should
  /// appear *outside* them (e.g. "-3 +" → "(-3) + □", not "-(3 + □)").
  /// Any other structural node (Trig, Log, Root, Fraction, Power, Paren,
  /// absolute-value Unary) is a scope boundary; the child of that node that
  /// contains the focus becomes the scope root.
  ExpressionNode _findScopeRoot(ExpressionNode globalRoot, NodeId focusId) {
    final path = _pathToNode(globalRoot, focusId);
    if (path == null) return globalRoot;
    for (int i = path.length - 1; i >= 1; i--) {
      final parent = path[i - 1];
      if (parent is BinaryOpNode) continue;
      if (parent is UnaryOpNode && parent.op == UnaryOperatorType.negate) {
        continue; // negate binds tightly to its operand; binary ops escape it
      }
      return path[i]; // first scope boundary — child is scope root
    }
    return globalRoot; // only transparent nodes above — scope is global root
  }

  /// Precedence-aware variant of [_findScopeRoot] used by [insertBinaryOp].
  ///
  /// A [BinaryOpNode] ancestor is transparent only when its operator's
  /// precedence is ≥ [insertingOp]'s precedence. This ensures that inserting
  /// a high-precedence operator (× or ÷) does NOT absorb a surrounding
  /// lower-precedence expression:
  ///   cursor after "3" in "4+3", press × → scope = 3  → "4 + (3×□)"  ✓
  ///   cursor after "3" in "4+3", press + → scope = 4+3 → "(4+3)+□"   ✓
  ExpressionNode _findScopeRootForBinaryOp(
      ExpressionNode globalRoot, NodeId focusId, OperatorType insertingOp) {
    final path = _pathToNode(globalRoot, focusId);
    if (path == null) return globalRoot;
    final insertingPrec = insertingOp.precedence;
    for (int i = path.length - 1; i >= 1; i--) {
      final parent = path[i - 1];
      if (parent is BinaryOpNode && parent.op.precedence >= insertingPrec) {
        continue; // same-or-higher precedence: transparent
      }
      if (parent is UnaryOpNode && parent.op == UnaryOperatorType.negate) {
        continue; // negate is always transparent
      }
      return path[i];
    }
    return globalRoot;
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

  /// Like [_insertAtFocusedPlaceholder], but when the cursor is at the exit
  /// of a [NumberNode] or [ConstantNode] auto-inserts an implicit multiply:
  ///   2  + sin  →  2 × sin(□)
  ///   π  + √    →  π × √(□)
  void _insertWithImplicitMultiply(
      ExpressionNode newNode, CursorPosition newCursor) {
    final focusId = state.cursor.focusedNodeId;
    final k = state.cursor.charOffset;
    final node = _findNode(state.expressionRoot, focusId);

    final atExit = switch (node) {
      NumberNode(:final raw) => k == raw.length,
      ConstantNode() => k == 1,
      _ => false,
    };

    if (atExit) {
      _emitReplaced(
        focusId,
        ExpressionNode.binaryOp(
          id: _newId(),
          op: OperatorType.multiply,
          left: node!,
          right: newNode,
        ),
        newCursor,
      );
      return;
    }

    _insertAtFocusedPlaceholder(newNode, newCursor);
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
