// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CalculationResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rational? exact, double value) value,
    required TResult Function(String message, String? culpritNodeId) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rational? exact, double value)? value,
    TResult? Function(String message, String? culpritNodeId)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rational? exact, double value)? value,
    TResult Function(String message, String? culpritNodeId)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalculationResultValue value) value,
    required TResult Function(CalculationResultError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalculationResultValue value)? value,
    TResult? Function(CalculationResultError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalculationResultValue value)? value,
    TResult Function(CalculationResultError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationResultCopyWith<$Res> {
  factory $CalculationResultCopyWith(
    CalculationResult value,
    $Res Function(CalculationResult) then,
  ) = _$CalculationResultCopyWithImpl<$Res, CalculationResult>;
}

/// @nodoc
class _$CalculationResultCopyWithImpl<$Res, $Val extends CalculationResult>
    implements $CalculationResultCopyWith<$Res> {
  _$CalculationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CalculationResultValueImplCopyWith<$Res> {
  factory _$$CalculationResultValueImplCopyWith(
    _$CalculationResultValueImpl value,
    $Res Function(_$CalculationResultValueImpl) then,
  ) = __$$CalculationResultValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Rational? exact, double value});
}

/// @nodoc
class __$$CalculationResultValueImplCopyWithImpl<$Res>
    extends _$CalculationResultCopyWithImpl<$Res, _$CalculationResultValueImpl>
    implements _$$CalculationResultValueImplCopyWith<$Res> {
  __$$CalculationResultValueImplCopyWithImpl(
    _$CalculationResultValueImpl _value,
    $Res Function(_$CalculationResultValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exact = freezed, Object? value = null}) {
    return _then(
      _$CalculationResultValueImpl(
        exact: freezed == exact
            ? _value.exact
            : exact // ignore: cast_nullable_to_non_nullable
                  as Rational?,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$CalculationResultValueImpl implements CalculationResultValue {
  const _$CalculationResultValueImpl({this.exact, required this.value});

  /// Exact rational value when available (e.g. 1/3 for 0.333...).
  @override
  final Rational? exact;

  /// Double representation used for all display formats.
  @override
  final double value;

  @override
  String toString() {
    return 'CalculationResult.value(exact: $exact, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationResultValueImpl &&
            (identical(other.exact, exact) || other.exact == exact) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exact, value);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationResultValueImplCopyWith<_$CalculationResultValueImpl>
  get copyWith =>
      __$$CalculationResultValueImplCopyWithImpl<_$CalculationResultValueImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rational? exact, double value) value,
    required TResult Function(String message, String? culpritNodeId) error,
  }) {
    return value(exact, this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rational? exact, double value)? value,
    TResult? Function(String message, String? culpritNodeId)? error,
  }) {
    return value?.call(exact, this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rational? exact, double value)? value,
    TResult Function(String message, String? culpritNodeId)? error,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(exact, this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalculationResultValue value) value,
    required TResult Function(CalculationResultError value) error,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalculationResultValue value)? value,
    TResult? Function(CalculationResultError value)? error,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalculationResultValue value)? value,
    TResult Function(CalculationResultError value)? error,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class CalculationResultValue implements CalculationResult {
  const factory CalculationResultValue({
    final Rational? exact,
    required final double value,
  }) = _$CalculationResultValueImpl;

  /// Exact rational value when available (e.g. 1/3 for 0.333...).
  Rational? get exact;

  /// Double representation used for all display formats.
  double get value;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationResultValueImplCopyWith<_$CalculationResultValueImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CalculationResultErrorImplCopyWith<$Res> {
  factory _$$CalculationResultErrorImplCopyWith(
    _$CalculationResultErrorImpl value,
    $Res Function(_$CalculationResultErrorImpl) then,
  ) = __$$CalculationResultErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? culpritNodeId});
}

/// @nodoc
class __$$CalculationResultErrorImplCopyWithImpl<$Res>
    extends _$CalculationResultCopyWithImpl<$Res, _$CalculationResultErrorImpl>
    implements _$$CalculationResultErrorImplCopyWith<$Res> {
  __$$CalculationResultErrorImplCopyWithImpl(
    _$CalculationResultErrorImpl _value,
    $Res Function(_$CalculationResultErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? culpritNodeId = freezed}) {
    return _then(
      _$CalculationResultErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        culpritNodeId: freezed == culpritNodeId
            ? _value.culpritNodeId
            : culpritNodeId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CalculationResultErrorImpl implements CalculationResultError {
  const _$CalculationResultErrorImpl({
    required this.message,
    this.culpritNodeId,
  });

  @override
  final String message;
  @override
  final String? culpritNodeId;

  @override
  String toString() {
    return 'CalculationResult.error(message: $message, culpritNodeId: $culpritNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationResultErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.culpritNodeId, culpritNodeId) ||
                other.culpritNodeId == culpritNodeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, culpritNodeId);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationResultErrorImplCopyWith<_$CalculationResultErrorImpl>
  get copyWith =>
      __$$CalculationResultErrorImplCopyWithImpl<_$CalculationResultErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rational? exact, double value) value,
    required TResult Function(String message, String? culpritNodeId) error,
  }) {
    return error(message, culpritNodeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rational? exact, double value)? value,
    TResult? Function(String message, String? culpritNodeId)? error,
  }) {
    return error?.call(message, culpritNodeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rational? exact, double value)? value,
    TResult Function(String message, String? culpritNodeId)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, culpritNodeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalculationResultValue value) value,
    required TResult Function(CalculationResultError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalculationResultValue value)? value,
    TResult? Function(CalculationResultError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalculationResultValue value)? value,
    TResult Function(CalculationResultError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CalculationResultError implements CalculationResult {
  const factory CalculationResultError({
    required final String message,
    final String? culpritNodeId,
  }) = _$CalculationResultErrorImpl;

  String get message;
  String? get culpritNodeId;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationResultErrorImplCopyWith<_$CalculationResultErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
