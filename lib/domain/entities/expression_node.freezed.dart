// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expression_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExpressionNode {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpressionNodeCopyWith<ExpressionNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpressionNodeCopyWith<$Res> {
  factory $ExpressionNodeCopyWith(
    ExpressionNode value,
    $Res Function(ExpressionNode) then,
  ) = _$ExpressionNodeCopyWithImpl<$Res, ExpressionNode>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ExpressionNodeCopyWithImpl<$Res, $Val extends ExpressionNode>
    implements $ExpressionNodeCopyWith<$Res> {
  _$ExpressionNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaceholderNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$PlaceholderNodeImplCopyWith(
    _$PlaceholderNodeImpl value,
    $Res Function(_$PlaceholderNodeImpl) then,
  ) = __$$PlaceholderNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PlaceholderNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$PlaceholderNodeImpl>
    implements _$$PlaceholderNodeImplCopyWith<$Res> {
  __$$PlaceholderNodeImplCopyWithImpl(
    _$PlaceholderNodeImpl _value,
    $Res Function(_$PlaceholderNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$PlaceholderNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PlaceholderNodeImpl implements PlaceholderNode {
  const _$PlaceholderNodeImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ExpressionNode.placeholder(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceholderNodeImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceholderNodeImplCopyWith<_$PlaceholderNodeImpl> get copyWith =>
      __$$PlaceholderNodeImplCopyWithImpl<_$PlaceholderNodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return placeholder(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return placeholder?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (placeholder != null) {
      return placeholder(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return placeholder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return placeholder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (placeholder != null) {
      return placeholder(this);
    }
    return orElse();
  }
}

abstract class PlaceholderNode implements ExpressionNode {
  const factory PlaceholderNode({required final String id}) =
      _$PlaceholderNodeImpl;

  @override
  String get id;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceholderNodeImplCopyWith<_$PlaceholderNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$NumberNodeImplCopyWith(
    _$NumberNodeImpl value,
    $Res Function(_$NumberNodeImpl) then,
  ) = __$$NumberNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String raw});
}

/// @nodoc
class __$$NumberNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$NumberNodeImpl>
    implements _$$NumberNodeImplCopyWith<$Res> {
  __$$NumberNodeImplCopyWithImpl(
    _$NumberNodeImpl _value,
    $Res Function(_$NumberNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? raw = null}) {
    return _then(
      _$NumberNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        raw: null == raw
            ? _value.raw
            : raw // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NumberNodeImpl implements NumberNode {
  const _$NumberNodeImpl({required this.id, required this.raw});

  @override
  final String id;
  @override
  final String raw;

  @override
  String toString() {
    return 'ExpressionNode.number(id: $id, raw: $raw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.raw, raw) || other.raw == raw));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, raw);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberNodeImplCopyWith<_$NumberNodeImpl> get copyWith =>
      __$$NumberNodeImplCopyWithImpl<_$NumberNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return number(id, raw);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return number?.call(id, raw);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(id, raw);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return number(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return number?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(this);
    }
    return orElse();
  }
}

abstract class NumberNode implements ExpressionNode {
  const factory NumberNode({
    required final String id,
    required final String raw,
  }) = _$NumberNodeImpl;

  @override
  String get id;
  String get raw;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberNodeImplCopyWith<_$NumberNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConstantNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$ConstantNodeImplCopyWith(
    _$ConstantNodeImpl value,
    $Res Function(_$ConstantNodeImpl) then,
  ) = __$$ConstantNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ConstantType constant});
}

/// @nodoc
class __$$ConstantNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$ConstantNodeImpl>
    implements _$$ConstantNodeImplCopyWith<$Res> {
  __$$ConstantNodeImplCopyWithImpl(
    _$ConstantNodeImpl _value,
    $Res Function(_$ConstantNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? constant = null}) {
    return _then(
      _$ConstantNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        constant: null == constant
            ? _value.constant
            : constant // ignore: cast_nullable_to_non_nullable
                  as ConstantType,
      ),
    );
  }
}

/// @nodoc

class _$ConstantNodeImpl implements ConstantNode {
  const _$ConstantNodeImpl({required this.id, required this.constant});

  @override
  final String id;
  @override
  final ConstantType constant;

  @override
  String toString() {
    return 'ExpressionNode.constant(id: $id, constant: $constant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstantNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.constant, constant) ||
                other.constant == constant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, constant);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstantNodeImplCopyWith<_$ConstantNodeImpl> get copyWith =>
      __$$ConstantNodeImplCopyWithImpl<_$ConstantNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return constant(id, this.constant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return constant?.call(id, this.constant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (constant != null) {
      return constant(id, this.constant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return constant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return constant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (constant != null) {
      return constant(this);
    }
    return orElse();
  }
}

abstract class ConstantNode implements ExpressionNode {
  const factory ConstantNode({
    required final String id,
    required final ConstantType constant,
  }) = _$ConstantNodeImpl;

  @override
  String get id;
  ConstantType get constant;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConstantNodeImplCopyWith<_$ConstantNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BinaryOpNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$BinaryOpNodeImplCopyWith(
    _$BinaryOpNodeImpl value,
    $Res Function(_$BinaryOpNodeImpl) then,
  ) = __$$BinaryOpNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    OperatorType op,
    ExpressionNode left,
    ExpressionNode right,
  });

  $ExpressionNodeCopyWith<$Res> get left;
  $ExpressionNodeCopyWith<$Res> get right;
}

/// @nodoc
class __$$BinaryOpNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$BinaryOpNodeImpl>
    implements _$$BinaryOpNodeImplCopyWith<$Res> {
  __$$BinaryOpNodeImplCopyWithImpl(
    _$BinaryOpNodeImpl _value,
    $Res Function(_$BinaryOpNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? op = null,
    Object? left = null,
    Object? right = null,
  }) {
    return _then(
      _$BinaryOpNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        op: null == op
            ? _value.op
            : op // ignore: cast_nullable_to_non_nullable
                  as OperatorType,
        left: null == left
            ? _value.left
            : left // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        right: null == right
            ? _value.right
            : right // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get left {
    return $ExpressionNodeCopyWith<$Res>(_value.left, (value) {
      return _then(_value.copyWith(left: value));
    });
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get right {
    return $ExpressionNodeCopyWith<$Res>(_value.right, (value) {
      return _then(_value.copyWith(right: value));
    });
  }
}

/// @nodoc

class _$BinaryOpNodeImpl implements BinaryOpNode {
  const _$BinaryOpNodeImpl({
    required this.id,
    required this.op,
    required this.left,
    required this.right,
  });

  @override
  final String id;
  @override
  final OperatorType op;
  @override
  final ExpressionNode left;
  @override
  final ExpressionNode right;

  @override
  String toString() {
    return 'ExpressionNode.binaryOp(id: $id, op: $op, left: $left, right: $right)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BinaryOpNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, op, left, right);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BinaryOpNodeImplCopyWith<_$BinaryOpNodeImpl> get copyWith =>
      __$$BinaryOpNodeImplCopyWithImpl<_$BinaryOpNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return binaryOp(id, op, left, right);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return binaryOp?.call(id, op, left, right);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (binaryOp != null) {
      return binaryOp(id, op, left, right);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return binaryOp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return binaryOp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (binaryOp != null) {
      return binaryOp(this);
    }
    return orElse();
  }
}

abstract class BinaryOpNode implements ExpressionNode {
  const factory BinaryOpNode({
    required final String id,
    required final OperatorType op,
    required final ExpressionNode left,
    required final ExpressionNode right,
  }) = _$BinaryOpNodeImpl;

  @override
  String get id;
  OperatorType get op;
  ExpressionNode get left;
  ExpressionNode get right;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BinaryOpNodeImplCopyWith<_$BinaryOpNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnaryOpNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$UnaryOpNodeImplCopyWith(
    _$UnaryOpNodeImpl value,
    $Res Function(_$UnaryOpNodeImpl) then,
  ) = __$$UnaryOpNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UnaryOperatorType op, ExpressionNode operand});

  $ExpressionNodeCopyWith<$Res> get operand;
}

/// @nodoc
class __$$UnaryOpNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$UnaryOpNodeImpl>
    implements _$$UnaryOpNodeImplCopyWith<$Res> {
  __$$UnaryOpNodeImplCopyWithImpl(
    _$UnaryOpNodeImpl _value,
    $Res Function(_$UnaryOpNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? op = null, Object? operand = null}) {
    return _then(
      _$UnaryOpNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        op: null == op
            ? _value.op
            : op // ignore: cast_nullable_to_non_nullable
                  as UnaryOperatorType,
        operand: null == operand
            ? _value.operand
            : operand // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get operand {
    return $ExpressionNodeCopyWith<$Res>(_value.operand, (value) {
      return _then(_value.copyWith(operand: value));
    });
  }
}

/// @nodoc

class _$UnaryOpNodeImpl implements UnaryOpNode {
  const _$UnaryOpNodeImpl({
    required this.id,
    required this.op,
    required this.operand,
  });

  @override
  final String id;
  @override
  final UnaryOperatorType op;
  @override
  final ExpressionNode operand;

  @override
  String toString() {
    return 'ExpressionNode.unaryOp(id: $id, op: $op, operand: $operand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnaryOpNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.operand, operand) || other.operand == operand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, op, operand);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnaryOpNodeImplCopyWith<_$UnaryOpNodeImpl> get copyWith =>
      __$$UnaryOpNodeImplCopyWithImpl<_$UnaryOpNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return unaryOp(id, op, operand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return unaryOp?.call(id, op, operand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (unaryOp != null) {
      return unaryOp(id, op, operand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return unaryOp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return unaryOp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (unaryOp != null) {
      return unaryOp(this);
    }
    return orElse();
  }
}

abstract class UnaryOpNode implements ExpressionNode {
  const factory UnaryOpNode({
    required final String id,
    required final UnaryOperatorType op,
    required final ExpressionNode operand,
  }) = _$UnaryOpNodeImpl;

  @override
  String get id;
  UnaryOperatorType get op;
  ExpressionNode get operand;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnaryOpNodeImplCopyWith<_$UnaryOpNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FractionNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$FractionNodeImplCopyWith(
    _$FractionNodeImpl value,
    $Res Function(_$FractionNodeImpl) then,
  ) = __$$FractionNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ExpressionNode numerator, ExpressionNode denominator});

  $ExpressionNodeCopyWith<$Res> get numerator;
  $ExpressionNodeCopyWith<$Res> get denominator;
}

/// @nodoc
class __$$FractionNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$FractionNodeImpl>
    implements _$$FractionNodeImplCopyWith<$Res> {
  __$$FractionNodeImplCopyWithImpl(
    _$FractionNodeImpl _value,
    $Res Function(_$FractionNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numerator = null,
    Object? denominator = null,
  }) {
    return _then(
      _$FractionNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        numerator: null == numerator
            ? _value.numerator
            : numerator // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        denominator: null == denominator
            ? _value.denominator
            : denominator // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get numerator {
    return $ExpressionNodeCopyWith<$Res>(_value.numerator, (value) {
      return _then(_value.copyWith(numerator: value));
    });
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get denominator {
    return $ExpressionNodeCopyWith<$Res>(_value.denominator, (value) {
      return _then(_value.copyWith(denominator: value));
    });
  }
}

/// @nodoc

class _$FractionNodeImpl implements FractionNode {
  const _$FractionNodeImpl({
    required this.id,
    required this.numerator,
    required this.denominator,
  });

  @override
  final String id;
  @override
  final ExpressionNode numerator;
  @override
  final ExpressionNode denominator;

  @override
  String toString() {
    return 'ExpressionNode.fraction(id: $id, numerator: $numerator, denominator: $denominator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FractionNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numerator, numerator) ||
                other.numerator == numerator) &&
            (identical(other.denominator, denominator) ||
                other.denominator == denominator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, numerator, denominator);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FractionNodeImplCopyWith<_$FractionNodeImpl> get copyWith =>
      __$$FractionNodeImplCopyWithImpl<_$FractionNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return fraction(id, numerator, denominator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return fraction?.call(id, numerator, denominator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (fraction != null) {
      return fraction(id, numerator, denominator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return fraction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return fraction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (fraction != null) {
      return fraction(this);
    }
    return orElse();
  }
}

abstract class FractionNode implements ExpressionNode {
  const factory FractionNode({
    required final String id,
    required final ExpressionNode numerator,
    required final ExpressionNode denominator,
  }) = _$FractionNodeImpl;

  @override
  String get id;
  ExpressionNode get numerator;
  ExpressionNode get denominator;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FractionNodeImplCopyWith<_$FractionNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RootNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$RootNodeImplCopyWith(
    _$RootNodeImpl value,
    $Res Function(_$RootNodeImpl) then,
  ) = __$$RootNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ExpressionNode radicand, ExpressionNode? index});

  $ExpressionNodeCopyWith<$Res> get radicand;
  $ExpressionNodeCopyWith<$Res>? get index;
}

/// @nodoc
class __$$RootNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$RootNodeImpl>
    implements _$$RootNodeImplCopyWith<$Res> {
  __$$RootNodeImplCopyWithImpl(
    _$RootNodeImpl _value,
    $Res Function(_$RootNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? radicand = null,
    Object? index = freezed,
  }) {
    return _then(
      _$RootNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        radicand: null == radicand
            ? _value.radicand
            : radicand // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        index: freezed == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode?,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get radicand {
    return $ExpressionNodeCopyWith<$Res>(_value.radicand, (value) {
      return _then(_value.copyWith(radicand: value));
    });
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res>? get index {
    if (_value.index == null) {
      return null;
    }

    return $ExpressionNodeCopyWith<$Res>(_value.index!, (value) {
      return _then(_value.copyWith(index: value));
    });
  }
}

/// @nodoc

class _$RootNodeImpl implements RootNode {
  const _$RootNodeImpl({required this.id, required this.radicand, this.index});

  @override
  final String id;
  @override
  final ExpressionNode radicand;
  @override
  final ExpressionNode? index;

  @override
  String toString() {
    return 'ExpressionNode.root(id: $id, radicand: $radicand, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radicand, radicand) ||
                other.radicand == radicand) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, radicand, index);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RootNodeImplCopyWith<_$RootNodeImpl> get copyWith =>
      __$$RootNodeImplCopyWithImpl<_$RootNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return root(id, radicand, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return root?.call(id, radicand, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (root != null) {
      return root(id, radicand, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return root(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return root?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (root != null) {
      return root(this);
    }
    return orElse();
  }
}

abstract class RootNode implements ExpressionNode {
  const factory RootNode({
    required final String id,
    required final ExpressionNode radicand,
    final ExpressionNode? index,
  }) = _$RootNodeImpl;

  @override
  String get id;
  ExpressionNode get radicand;
  ExpressionNode? get index;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RootNodeImplCopyWith<_$RootNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PowerNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$PowerNodeImplCopyWith(
    _$PowerNodeImpl value,
    $Res Function(_$PowerNodeImpl) then,
  ) = __$$PowerNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ExpressionNode base, ExpressionNode exponent});

  $ExpressionNodeCopyWith<$Res> get base;
  $ExpressionNodeCopyWith<$Res> get exponent;
}

/// @nodoc
class __$$PowerNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$PowerNodeImpl>
    implements _$$PowerNodeImplCopyWith<$Res> {
  __$$PowerNodeImplCopyWithImpl(
    _$PowerNodeImpl _value,
    $Res Function(_$PowerNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? base = null, Object? exponent = null}) {
    return _then(
      _$PowerNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        base: null == base
            ? _value.base
            : base // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        exponent: null == exponent
            ? _value.exponent
            : exponent // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get base {
    return $ExpressionNodeCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value));
    });
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get exponent {
    return $ExpressionNodeCopyWith<$Res>(_value.exponent, (value) {
      return _then(_value.copyWith(exponent: value));
    });
  }
}

/// @nodoc

class _$PowerNodeImpl implements PowerNode {
  const _$PowerNodeImpl({
    required this.id,
    required this.base,
    required this.exponent,
  });

  @override
  final String id;
  @override
  final ExpressionNode base;
  @override
  final ExpressionNode exponent;

  @override
  String toString() {
    return 'ExpressionNode.power(id: $id, base: $base, exponent: $exponent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.exponent, exponent) ||
                other.exponent == exponent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, base, exponent);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerNodeImplCopyWith<_$PowerNodeImpl> get copyWith =>
      __$$PowerNodeImplCopyWithImpl<_$PowerNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return power(id, base, exponent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return power?.call(id, base, exponent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (power != null) {
      return power(id, base, exponent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return power(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return power?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (power != null) {
      return power(this);
    }
    return orElse();
  }
}

abstract class PowerNode implements ExpressionNode {
  const factory PowerNode({
    required final String id,
    required final ExpressionNode base,
    required final ExpressionNode exponent,
  }) = _$PowerNodeImpl;

  @override
  String get id;
  ExpressionNode get base;
  ExpressionNode get exponent;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerNodeImplCopyWith<_$PowerNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrigFunctionNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$TrigFunctionNodeImplCopyWith(
    _$TrigFunctionNodeImpl value,
    $Res Function(_$TrigFunctionNodeImpl) then,
  ) = __$$TrigFunctionNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, TrigFunctionType func, ExpressionNode argument});

  $ExpressionNodeCopyWith<$Res> get argument;
}

/// @nodoc
class __$$TrigFunctionNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$TrigFunctionNodeImpl>
    implements _$$TrigFunctionNodeImplCopyWith<$Res> {
  __$$TrigFunctionNodeImplCopyWithImpl(
    _$TrigFunctionNodeImpl _value,
    $Res Function(_$TrigFunctionNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? func = null, Object? argument = null}) {
    return _then(
      _$TrigFunctionNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        func: null == func
            ? _value.func
            : func // ignore: cast_nullable_to_non_nullable
                  as TrigFunctionType,
        argument: null == argument
            ? _value.argument
            : argument // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get argument {
    return $ExpressionNodeCopyWith<$Res>(_value.argument, (value) {
      return _then(_value.copyWith(argument: value));
    });
  }
}

/// @nodoc

class _$TrigFunctionNodeImpl implements TrigFunctionNode {
  const _$TrigFunctionNodeImpl({
    required this.id,
    required this.func,
    required this.argument,
  });

  @override
  final String id;
  @override
  final TrigFunctionType func;
  @override
  final ExpressionNode argument;

  @override
  String toString() {
    return 'ExpressionNode.trigFunction(id: $id, func: $func, argument: $argument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrigFunctionNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.func, func) || other.func == func) &&
            (identical(other.argument, argument) ||
                other.argument == argument));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, func, argument);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrigFunctionNodeImplCopyWith<_$TrigFunctionNodeImpl> get copyWith =>
      __$$TrigFunctionNodeImplCopyWithImpl<_$TrigFunctionNodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return trigFunction(id, func, argument);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return trigFunction?.call(id, func, argument);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (trigFunction != null) {
      return trigFunction(id, func, argument);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return trigFunction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return trigFunction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (trigFunction != null) {
      return trigFunction(this);
    }
    return orElse();
  }
}

abstract class TrigFunctionNode implements ExpressionNode {
  const factory TrigFunctionNode({
    required final String id,
    required final TrigFunctionType func,
    required final ExpressionNode argument,
  }) = _$TrigFunctionNodeImpl;

  @override
  String get id;
  TrigFunctionType get func;
  ExpressionNode get argument;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrigFunctionNodeImplCopyWith<_$TrigFunctionNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogFunctionNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$LogFunctionNodeImplCopyWith(
    _$LogFunctionNodeImpl value,
    $Res Function(_$LogFunctionNodeImpl) then,
  ) = __$$LogFunctionNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    LogType logType,
    ExpressionNode argument,
    ExpressionNode? base,
  });

  $ExpressionNodeCopyWith<$Res> get argument;
  $ExpressionNodeCopyWith<$Res>? get base;
}

/// @nodoc
class __$$LogFunctionNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$LogFunctionNodeImpl>
    implements _$$LogFunctionNodeImplCopyWith<$Res> {
  __$$LogFunctionNodeImplCopyWithImpl(
    _$LogFunctionNodeImpl _value,
    $Res Function(_$LogFunctionNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logType = null,
    Object? argument = null,
    Object? base = freezed,
  }) {
    return _then(
      _$LogFunctionNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        logType: null == logType
            ? _value.logType
            : logType // ignore: cast_nullable_to_non_nullable
                  as LogType,
        argument: null == argument
            ? _value.argument
            : argument // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        base: freezed == base
            ? _value.base
            : base // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode?,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get argument {
    return $ExpressionNodeCopyWith<$Res>(_value.argument, (value) {
      return _then(_value.copyWith(argument: value));
    });
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res>? get base {
    if (_value.base == null) {
      return null;
    }

    return $ExpressionNodeCopyWith<$Res>(_value.base!, (value) {
      return _then(_value.copyWith(base: value));
    });
  }
}

/// @nodoc

class _$LogFunctionNodeImpl implements LogFunctionNode {
  const _$LogFunctionNodeImpl({
    required this.id,
    required this.logType,
    required this.argument,
    this.base,
  });

  @override
  final String id;
  @override
  final LogType logType;
  @override
  final ExpressionNode argument;
  @override
  final ExpressionNode? base;

  @override
  String toString() {
    return 'ExpressionNode.logFunction(id: $id, logType: $logType, argument: $argument, base: $base)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFunctionNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logType, logType) || other.logType == logType) &&
            (identical(other.argument, argument) ||
                other.argument == argument) &&
            (identical(other.base, base) || other.base == base));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, logType, argument, base);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFunctionNodeImplCopyWith<_$LogFunctionNodeImpl> get copyWith =>
      __$$LogFunctionNodeImplCopyWithImpl<_$LogFunctionNodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return logFunction(id, logType, argument, base);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return logFunction?.call(id, logType, argument, base);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (logFunction != null) {
      return logFunction(id, logType, argument, base);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return logFunction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return logFunction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (logFunction != null) {
      return logFunction(this);
    }
    return orElse();
  }
}

abstract class LogFunctionNode implements ExpressionNode {
  const factory LogFunctionNode({
    required final String id,
    required final LogType logType,
    required final ExpressionNode argument,
    final ExpressionNode? base,
  }) = _$LogFunctionNodeImpl;

  @override
  String get id;
  LogType get logType;
  ExpressionNode get argument;
  ExpressionNode? get base;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogFunctionNodeImplCopyWith<_$LogFunctionNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParenthesizedNodeImplCopyWith<$Res>
    implements $ExpressionNodeCopyWith<$Res> {
  factory _$$ParenthesizedNodeImplCopyWith(
    _$ParenthesizedNodeImpl value,
    $Res Function(_$ParenthesizedNodeImpl) then,
  ) = __$$ParenthesizedNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, ExpressionNode inner});

  $ExpressionNodeCopyWith<$Res> get inner;
}

/// @nodoc
class __$$ParenthesizedNodeImplCopyWithImpl<$Res>
    extends _$ExpressionNodeCopyWithImpl<$Res, _$ParenthesizedNodeImpl>
    implements _$$ParenthesizedNodeImplCopyWith<$Res> {
  __$$ParenthesizedNodeImplCopyWithImpl(
    _$ParenthesizedNodeImpl _value,
    $Res Function(_$ParenthesizedNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? inner = null}) {
    return _then(
      _$ParenthesizedNodeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        inner: null == inner
            ? _value.inner
            : inner // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
      ),
    );
  }

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get inner {
    return $ExpressionNodeCopyWith<$Res>(_value.inner, (value) {
      return _then(_value.copyWith(inner: value));
    });
  }
}

/// @nodoc

class _$ParenthesizedNodeImpl implements ParenthesizedNode {
  const _$ParenthesizedNodeImpl({required this.id, required this.inner});

  @override
  final String id;
  @override
  final ExpressionNode inner;

  @override
  String toString() {
    return 'ExpressionNode.parenthesized(id: $id, inner: $inner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParenthesizedNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inner, inner) || other.inner == inner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, inner);

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParenthesizedNodeImplCopyWith<_$ParenthesizedNodeImpl> get copyWith =>
      __$$ParenthesizedNodeImplCopyWithImpl<_$ParenthesizedNodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) placeholder,
    required TResult Function(String id, String raw) number,
    required TResult Function(String id, ConstantType constant) constant,
    required TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )
    binaryOp,
    required TResult Function(
      String id,
      UnaryOperatorType op,
      ExpressionNode operand,
    )
    unaryOp,
    required TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )
    fraction,
    required TResult Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )
    root,
    required TResult Function(
      String id,
      ExpressionNode base,
      ExpressionNode exponent,
    )
    power,
    required TResult Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )
    trigFunction,
    required TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )
    logFunction,
    required TResult Function(String id, ExpressionNode inner) parenthesized,
  }) {
    return parenthesized(id, inner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? placeholder,
    TResult? Function(String id, String raw)? number,
    TResult? Function(String id, ConstantType constant)? constant,
    TResult? Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult? Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult? Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult? Function(
      String id,
      ExpressionNode radicand,
      ExpressionNode? index,
    )?
    root,
    TResult? Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult? Function(
      String id,
      TrigFunctionType func,
      ExpressionNode argument,
    )?
    trigFunction,
    TResult? Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult? Function(String id, ExpressionNode inner)? parenthesized,
  }) {
    return parenthesized?.call(id, inner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? placeholder,
    TResult Function(String id, String raw)? number,
    TResult Function(String id, ConstantType constant)? constant,
    TResult Function(
      String id,
      OperatorType op,
      ExpressionNode left,
      ExpressionNode right,
    )?
    binaryOp,
    TResult Function(String id, UnaryOperatorType op, ExpressionNode operand)?
    unaryOp,
    TResult Function(
      String id,
      ExpressionNode numerator,
      ExpressionNode denominator,
    )?
    fraction,
    TResult Function(String id, ExpressionNode radicand, ExpressionNode? index)?
    root,
    TResult Function(String id, ExpressionNode base, ExpressionNode exponent)?
    power,
    TResult Function(String id, TrigFunctionType func, ExpressionNode argument)?
    trigFunction,
    TResult Function(
      String id,
      LogType logType,
      ExpressionNode argument,
      ExpressionNode? base,
    )?
    logFunction,
    TResult Function(String id, ExpressionNode inner)? parenthesized,
    required TResult orElse(),
  }) {
    if (parenthesized != null) {
      return parenthesized(id, inner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceholderNode value) placeholder,
    required TResult Function(NumberNode value) number,
    required TResult Function(ConstantNode value) constant,
    required TResult Function(BinaryOpNode value) binaryOp,
    required TResult Function(UnaryOpNode value) unaryOp,
    required TResult Function(FractionNode value) fraction,
    required TResult Function(RootNode value) root,
    required TResult Function(PowerNode value) power,
    required TResult Function(TrigFunctionNode value) trigFunction,
    required TResult Function(LogFunctionNode value) logFunction,
    required TResult Function(ParenthesizedNode value) parenthesized,
  }) {
    return parenthesized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceholderNode value)? placeholder,
    TResult? Function(NumberNode value)? number,
    TResult? Function(ConstantNode value)? constant,
    TResult? Function(BinaryOpNode value)? binaryOp,
    TResult? Function(UnaryOpNode value)? unaryOp,
    TResult? Function(FractionNode value)? fraction,
    TResult? Function(RootNode value)? root,
    TResult? Function(PowerNode value)? power,
    TResult? Function(TrigFunctionNode value)? trigFunction,
    TResult? Function(LogFunctionNode value)? logFunction,
    TResult? Function(ParenthesizedNode value)? parenthesized,
  }) {
    return parenthesized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceholderNode value)? placeholder,
    TResult Function(NumberNode value)? number,
    TResult Function(ConstantNode value)? constant,
    TResult Function(BinaryOpNode value)? binaryOp,
    TResult Function(UnaryOpNode value)? unaryOp,
    TResult Function(FractionNode value)? fraction,
    TResult Function(RootNode value)? root,
    TResult Function(PowerNode value)? power,
    TResult Function(TrigFunctionNode value)? trigFunction,
    TResult Function(LogFunctionNode value)? logFunction,
    TResult Function(ParenthesizedNode value)? parenthesized,
    required TResult orElse(),
  }) {
    if (parenthesized != null) {
      return parenthesized(this);
    }
    return orElse();
  }
}

abstract class ParenthesizedNode implements ExpressionNode {
  const factory ParenthesizedNode({
    required final String id,
    required final ExpressionNode inner,
  }) = _$ParenthesizedNodeImpl;

  @override
  String get id;
  ExpressionNode get inner;

  /// Create a copy of ExpressionNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParenthesizedNodeImplCopyWith<_$ParenthesizedNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
