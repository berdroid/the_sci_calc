// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CalculatorState {
  ExpressionNode get expressionRoot => throw _privateConstructorUsedError;
  CursorPosition get cursor => throw _privateConstructorUsedError;
  SelectionRange? get selection => throw _privateConstructorUsedError;
  CalculationResult? get lastResult => throw _privateConstructorUsedError;
  bool get showingResult => throw _privateConstructorUsedError;
  AngleUnit get angleUnit => throw _privateConstructorUsedError;
  DisplayFormat get displayFormat => throw _privateConstructorUsedError;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
    CalculatorState value,
    $Res Function(CalculatorState) then,
  ) = _$CalculatorStateCopyWithImpl<$Res, CalculatorState>;
  @useResult
  $Res call({
    ExpressionNode expressionRoot,
    CursorPosition cursor,
    SelectionRange? selection,
    CalculationResult? lastResult,
    bool showingResult,
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
  });

  $ExpressionNodeCopyWith<$Res> get expressionRoot;
  $CursorPositionCopyWith<$Res> get cursor;
  $SelectionRangeCopyWith<$Res>? get selection;
  $CalculationResultCopyWith<$Res>? get lastResult;
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res, $Val extends CalculatorState>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expressionRoot = null,
    Object? cursor = null,
    Object? selection = freezed,
    Object? lastResult = freezed,
    Object? showingResult = null,
    Object? angleUnit = null,
    Object? displayFormat = null,
  }) {
    return _then(
      _value.copyWith(
            expressionRoot: null == expressionRoot
                ? _value.expressionRoot
                : expressionRoot // ignore: cast_nullable_to_non_nullable
                      as ExpressionNode,
            cursor: null == cursor
                ? _value.cursor
                : cursor // ignore: cast_nullable_to_non_nullable
                      as CursorPosition,
            selection: freezed == selection
                ? _value.selection
                : selection // ignore: cast_nullable_to_non_nullable
                      as SelectionRange?,
            lastResult: freezed == lastResult
                ? _value.lastResult
                : lastResult // ignore: cast_nullable_to_non_nullable
                      as CalculationResult?,
            showingResult: null == showingResult
                ? _value.showingResult
                : showingResult // ignore: cast_nullable_to_non_nullable
                      as bool,
            angleUnit: null == angleUnit
                ? _value.angleUnit
                : angleUnit // ignore: cast_nullable_to_non_nullable
                      as AngleUnit,
            displayFormat: null == displayFormat
                ? _value.displayFormat
                : displayFormat // ignore: cast_nullable_to_non_nullable
                      as DisplayFormat,
          )
          as $Val,
    );
  }

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get expressionRoot {
    return $ExpressionNodeCopyWith<$Res>(_value.expressionRoot, (value) {
      return _then(_value.copyWith(expressionRoot: value) as $Val);
    });
  }

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursorPositionCopyWith<$Res> get cursor {
    return $CursorPositionCopyWith<$Res>(_value.cursor, (value) {
      return _then(_value.copyWith(cursor: value) as $Val);
    });
  }

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelectionRangeCopyWith<$Res>? get selection {
    if (_value.selection == null) {
      return null;
    }

    return $SelectionRangeCopyWith<$Res>(_value.selection!, (value) {
      return _then(_value.copyWith(selection: value) as $Val);
    });
  }

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculationResultCopyWith<$Res>? get lastResult {
    if (_value.lastResult == null) {
      return null;
    }

    return $CalculationResultCopyWith<$Res>(_value.lastResult!, (value) {
      return _then(_value.copyWith(lastResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculatorStateImplCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$$CalculatorStateImplCopyWith(
    _$CalculatorStateImpl value,
    $Res Function(_$CalculatorStateImpl) then,
  ) = __$$CalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ExpressionNode expressionRoot,
    CursorPosition cursor,
    SelectionRange? selection,
    CalculationResult? lastResult,
    bool showingResult,
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
  });

  @override
  $ExpressionNodeCopyWith<$Res> get expressionRoot;
  @override
  $CursorPositionCopyWith<$Res> get cursor;
  @override
  $SelectionRangeCopyWith<$Res>? get selection;
  @override
  $CalculationResultCopyWith<$Res>? get lastResult;
}

/// @nodoc
class __$$CalculatorStateImplCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res, _$CalculatorStateImpl>
    implements _$$CalculatorStateImplCopyWith<$Res> {
  __$$CalculatorStateImplCopyWithImpl(
    _$CalculatorStateImpl _value,
    $Res Function(_$CalculatorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expressionRoot = null,
    Object? cursor = null,
    Object? selection = freezed,
    Object? lastResult = freezed,
    Object? showingResult = null,
    Object? angleUnit = null,
    Object? displayFormat = null,
  }) {
    return _then(
      _$CalculatorStateImpl(
        expressionRoot: null == expressionRoot
            ? _value.expressionRoot
            : expressionRoot // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        cursor: null == cursor
            ? _value.cursor
            : cursor // ignore: cast_nullable_to_non_nullable
                  as CursorPosition,
        selection: freezed == selection
            ? _value.selection
            : selection // ignore: cast_nullable_to_non_nullable
                  as SelectionRange?,
        lastResult: freezed == lastResult
            ? _value.lastResult
            : lastResult // ignore: cast_nullable_to_non_nullable
                  as CalculationResult?,
        showingResult: null == showingResult
            ? _value.showingResult
            : showingResult // ignore: cast_nullable_to_non_nullable
                  as bool,
        angleUnit: null == angleUnit
            ? _value.angleUnit
            : angleUnit // ignore: cast_nullable_to_non_nullable
                  as AngleUnit,
        displayFormat: null == displayFormat
            ? _value.displayFormat
            : displayFormat // ignore: cast_nullable_to_non_nullable
                  as DisplayFormat,
      ),
    );
  }
}

/// @nodoc

class _$CalculatorStateImpl implements _CalculatorState {
  const _$CalculatorStateImpl({
    required this.expressionRoot,
    required this.cursor,
    this.selection,
    this.lastResult,
    this.showingResult = false,
    this.angleUnit = AngleUnit.degrees,
    this.displayFormat = DisplayFormat.decimal,
  });

  @override
  final ExpressionNode expressionRoot;
  @override
  final CursorPosition cursor;
  @override
  final SelectionRange? selection;
  @override
  final CalculationResult? lastResult;
  @override
  @JsonKey()
  final bool showingResult;
  @override
  @JsonKey()
  final AngleUnit angleUnit;
  @override
  @JsonKey()
  final DisplayFormat displayFormat;

  @override
  String toString() {
    return 'CalculatorState(expressionRoot: $expressionRoot, cursor: $cursor, selection: $selection, lastResult: $lastResult, showingResult: $showingResult, angleUnit: $angleUnit, displayFormat: $displayFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorStateImpl &&
            (identical(other.expressionRoot, expressionRoot) ||
                other.expressionRoot == expressionRoot) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.selection, selection) ||
                other.selection == selection) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult) &&
            (identical(other.showingResult, showingResult) ||
                other.showingResult == showingResult) &&
            (identical(other.angleUnit, angleUnit) ||
                other.angleUnit == angleUnit) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    expressionRoot,
    cursor,
    selection,
    lastResult,
    showingResult,
    angleUnit,
    displayFormat,
  );

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      __$$CalculatorStateImplCopyWithImpl<_$CalculatorStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState({
    required final ExpressionNode expressionRoot,
    required final CursorPosition cursor,
    final SelectionRange? selection,
    final CalculationResult? lastResult,
    final bool showingResult,
    final AngleUnit angleUnit,
    final DisplayFormat displayFormat,
  }) = _$CalculatorStateImpl;

  @override
  ExpressionNode get expressionRoot;
  @override
  CursorPosition get cursor;
  @override
  SelectionRange? get selection;
  @override
  CalculationResult? get lastResult;
  @override
  bool get showingResult;
  @override
  AngleUnit get angleUnit;
  @override
  DisplayFormat get displayFormat;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
