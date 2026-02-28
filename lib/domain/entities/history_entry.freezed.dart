// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HistoryEntry {
  String get id => throw _privateConstructorUsedError;
  ExpressionNode get root => throw _privateConstructorUsedError;
  CalculationResult get result => throw _privateConstructorUsedError;
  AngleUnit get angleUnit => throw _privateConstructorUsedError;
  DisplayFormat get displayFormat => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
    HistoryEntry value,
    $Res Function(HistoryEntry) then,
  ) = _$HistoryEntryCopyWithImpl<$Res, HistoryEntry>;
  @useResult
  $Res call({
    String id,
    ExpressionNode root,
    CalculationResult result,
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
    DateTime timestamp,
  });

  $ExpressionNodeCopyWith<$Res> get root;
  $CalculationResultCopyWith<$Res> get result;
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res, $Val extends HistoryEntry>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? root = null,
    Object? result = null,
    Object? angleUnit = null,
    Object? displayFormat = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            root: null == root
                ? _value.root
                : root // ignore: cast_nullable_to_non_nullable
                      as ExpressionNode,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as CalculationResult,
            angleUnit: null == angleUnit
                ? _value.angleUnit
                : angleUnit // ignore: cast_nullable_to_non_nullable
                      as AngleUnit,
            displayFormat: null == displayFormat
                ? _value.displayFormat
                : displayFormat // ignore: cast_nullable_to_non_nullable
                      as DisplayFormat,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpressionNodeCopyWith<$Res> get root {
    return $ExpressionNodeCopyWith<$Res>(_value.root, (value) {
      return _then(_value.copyWith(root: value) as $Val);
    });
  }

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculationResultCopyWith<$Res> get result {
    return $CalculationResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryEntryImplCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$$HistoryEntryImplCopyWith(
    _$HistoryEntryImpl value,
    $Res Function(_$HistoryEntryImpl) then,
  ) = __$$HistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    ExpressionNode root,
    CalculationResult result,
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
    DateTime timestamp,
  });

  @override
  $ExpressionNodeCopyWith<$Res> get root;
  @override
  $CalculationResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$HistoryEntryImplCopyWithImpl<$Res>
    extends _$HistoryEntryCopyWithImpl<$Res, _$HistoryEntryImpl>
    implements _$$HistoryEntryImplCopyWith<$Res> {
  __$$HistoryEntryImplCopyWithImpl(
    _$HistoryEntryImpl _value,
    $Res Function(_$HistoryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? root = null,
    Object? result = null,
    Object? angleUnit = null,
    Object? displayFormat = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$HistoryEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        root: null == root
            ? _value.root
            : root // ignore: cast_nullable_to_non_nullable
                  as ExpressionNode,
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as CalculationResult,
        angleUnit: null == angleUnit
            ? _value.angleUnit
            : angleUnit // ignore: cast_nullable_to_non_nullable
                  as AngleUnit,
        displayFormat: null == displayFormat
            ? _value.displayFormat
            : displayFormat // ignore: cast_nullable_to_non_nullable
                  as DisplayFormat,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$HistoryEntryImpl implements _HistoryEntry {
  const _$HistoryEntryImpl({
    required this.id,
    required this.root,
    required this.result,
    required this.angleUnit,
    required this.displayFormat,
    required this.timestamp,
  });

  @override
  final String id;
  @override
  final ExpressionNode root;
  @override
  final CalculationResult result;
  @override
  final AngleUnit angleUnit;
  @override
  final DisplayFormat displayFormat;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'HistoryEntry(id: $id, root: $root, result: $result, angleUnit: $angleUnit, displayFormat: $displayFormat, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.angleUnit, angleUnit) ||
                other.angleUnit == angleUnit) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    root,
    result,
    angleUnit,
    displayFormat,
    timestamp,
  );

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      __$$HistoryEntryImplCopyWithImpl<_$HistoryEntryImpl>(this, _$identity);
}

abstract class _HistoryEntry implements HistoryEntry {
  const factory _HistoryEntry({
    required final String id,
    required final ExpressionNode root,
    required final CalculationResult result,
    required final AngleUnit angleUnit,
    required final DisplayFormat displayFormat,
    required final DateTime timestamp,
  }) = _$HistoryEntryImpl;

  @override
  String get id;
  @override
  ExpressionNode get root;
  @override
  CalculationResult get result;
  @override
  AngleUnit get angleUnit;
  @override
  DisplayFormat get displayFormat;
  @override
  DateTime get timestamp;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
