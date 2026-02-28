// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CursorPosition {
  String get focusedNodeId => throw _privateConstructorUsedError;
  int get charOffset => throw _privateConstructorUsedError;

  /// Create a copy of CursorPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursorPositionCopyWith<CursorPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorPositionCopyWith<$Res> {
  factory $CursorPositionCopyWith(
    CursorPosition value,
    $Res Function(CursorPosition) then,
  ) = _$CursorPositionCopyWithImpl<$Res, CursorPosition>;
  @useResult
  $Res call({String focusedNodeId, int charOffset});
}

/// @nodoc
class _$CursorPositionCopyWithImpl<$Res, $Val extends CursorPosition>
    implements $CursorPositionCopyWith<$Res> {
  _$CursorPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursorPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? focusedNodeId = null, Object? charOffset = null}) {
    return _then(
      _value.copyWith(
            focusedNodeId: null == focusedNodeId
                ? _value.focusedNodeId
                : focusedNodeId // ignore: cast_nullable_to_non_nullable
                      as String,
            charOffset: null == charOffset
                ? _value.charOffset
                : charOffset // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CursorPositionImplCopyWith<$Res>
    implements $CursorPositionCopyWith<$Res> {
  factory _$$CursorPositionImplCopyWith(
    _$CursorPositionImpl value,
    $Res Function(_$CursorPositionImpl) then,
  ) = __$$CursorPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String focusedNodeId, int charOffset});
}

/// @nodoc
class __$$CursorPositionImplCopyWithImpl<$Res>
    extends _$CursorPositionCopyWithImpl<$Res, _$CursorPositionImpl>
    implements _$$CursorPositionImplCopyWith<$Res> {
  __$$CursorPositionImplCopyWithImpl(
    _$CursorPositionImpl _value,
    $Res Function(_$CursorPositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CursorPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? focusedNodeId = null, Object? charOffset = null}) {
    return _then(
      _$CursorPositionImpl(
        focusedNodeId: null == focusedNodeId
            ? _value.focusedNodeId
            : focusedNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
        charOffset: null == charOffset
            ? _value.charOffset
            : charOffset // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CursorPositionImpl implements _CursorPosition {
  const _$CursorPositionImpl({
    required this.focusedNodeId,
    this.charOffset = 0,
  });

  @override
  final String focusedNodeId;
  @override
  @JsonKey()
  final int charOffset;

  @override
  String toString() {
    return 'CursorPosition(focusedNodeId: $focusedNodeId, charOffset: $charOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursorPositionImpl &&
            (identical(other.focusedNodeId, focusedNodeId) ||
                other.focusedNodeId == focusedNodeId) &&
            (identical(other.charOffset, charOffset) ||
                other.charOffset == charOffset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focusedNodeId, charOffset);

  /// Create a copy of CursorPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursorPositionImplCopyWith<_$CursorPositionImpl> get copyWith =>
      __$$CursorPositionImplCopyWithImpl<_$CursorPositionImpl>(
        this,
        _$identity,
      );
}

abstract class _CursorPosition implements CursorPosition {
  const factory _CursorPosition({
    required final String focusedNodeId,
    final int charOffset,
  }) = _$CursorPositionImpl;

  @override
  String get focusedNodeId;
  @override
  int get charOffset;

  /// Create a copy of CursorPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursorPositionImplCopyWith<_$CursorPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SelectionRange {
  String get anchorNodeId => throw _privateConstructorUsedError;
  String get extentNodeId => throw _privateConstructorUsedError;

  /// Create a copy of SelectionRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectionRangeCopyWith<SelectionRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionRangeCopyWith<$Res> {
  factory $SelectionRangeCopyWith(
    SelectionRange value,
    $Res Function(SelectionRange) then,
  ) = _$SelectionRangeCopyWithImpl<$Res, SelectionRange>;
  @useResult
  $Res call({String anchorNodeId, String extentNodeId});
}

/// @nodoc
class _$SelectionRangeCopyWithImpl<$Res, $Val extends SelectionRange>
    implements $SelectionRangeCopyWith<$Res> {
  _$SelectionRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectionRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? anchorNodeId = null, Object? extentNodeId = null}) {
    return _then(
      _value.copyWith(
            anchorNodeId: null == anchorNodeId
                ? _value.anchorNodeId
                : anchorNodeId // ignore: cast_nullable_to_non_nullable
                      as String,
            extentNodeId: null == extentNodeId
                ? _value.extentNodeId
                : extentNodeId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelectionRangeImplCopyWith<$Res>
    implements $SelectionRangeCopyWith<$Res> {
  factory _$$SelectionRangeImplCopyWith(
    _$SelectionRangeImpl value,
    $Res Function(_$SelectionRangeImpl) then,
  ) = __$$SelectionRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String anchorNodeId, String extentNodeId});
}

/// @nodoc
class __$$SelectionRangeImplCopyWithImpl<$Res>
    extends _$SelectionRangeCopyWithImpl<$Res, _$SelectionRangeImpl>
    implements _$$SelectionRangeImplCopyWith<$Res> {
  __$$SelectionRangeImplCopyWithImpl(
    _$SelectionRangeImpl _value,
    $Res Function(_$SelectionRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelectionRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? anchorNodeId = null, Object? extentNodeId = null}) {
    return _then(
      _$SelectionRangeImpl(
        anchorNodeId: null == anchorNodeId
            ? _value.anchorNodeId
            : anchorNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
        extentNodeId: null == extentNodeId
            ? _value.extentNodeId
            : extentNodeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SelectionRangeImpl implements _SelectionRange {
  const _$SelectionRangeImpl({
    required this.anchorNodeId,
    required this.extentNodeId,
  });

  @override
  final String anchorNodeId;
  @override
  final String extentNodeId;

  @override
  String toString() {
    return 'SelectionRange(anchorNodeId: $anchorNodeId, extentNodeId: $extentNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionRangeImpl &&
            (identical(other.anchorNodeId, anchorNodeId) ||
                other.anchorNodeId == anchorNodeId) &&
            (identical(other.extentNodeId, extentNodeId) ||
                other.extentNodeId == extentNodeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, anchorNodeId, extentNodeId);

  /// Create a copy of SelectionRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionRangeImplCopyWith<_$SelectionRangeImpl> get copyWith =>
      __$$SelectionRangeImplCopyWithImpl<_$SelectionRangeImpl>(
        this,
        _$identity,
      );
}

abstract class _SelectionRange implements SelectionRange {
  const factory _SelectionRange({
    required final String anchorNodeId,
    required final String extentNodeId,
  }) = _$SelectionRangeImpl;

  @override
  String get anchorNodeId;
  @override
  String get extentNodeId;

  /// Create a copy of SelectionRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectionRangeImplCopyWith<_$SelectionRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
