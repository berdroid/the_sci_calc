// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsState {
  AngleUnit get angleUnit => throw _privateConstructorUsedError;
  DisplayFormat get displayFormat => throw _privateConstructorUsedError;
  ThemeModePreference get themeMode => throw _privateConstructorUsedError;
  bool get isLoaded => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
    SettingsState value,
    $Res Function(SettingsState) then,
  ) = _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
    ThemeModePreference themeMode,
    bool isLoaded,
  });
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angleUnit = null,
    Object? displayFormat = null,
    Object? themeMode = null,
    Object? isLoaded = null,
  }) {
    return _then(
      _value.copyWith(
            angleUnit: null == angleUnit
                ? _value.angleUnit
                : angleUnit // ignore: cast_nullable_to_non_nullable
                      as AngleUnit,
            displayFormat: null == displayFormat
                ? _value.displayFormat
                : displayFormat // ignore: cast_nullable_to_non_nullable
                      as DisplayFormat,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeModePreference,
            isLoaded: null == isLoaded
                ? _value.isLoaded
                : isLoaded // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
    _$SettingsStateImpl value,
    $Res Function(_$SettingsStateImpl) then,
  ) = __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AngleUnit angleUnit,
    DisplayFormat displayFormat,
    ThemeModePreference themeMode,
    bool isLoaded,
  });
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
    _$SettingsStateImpl _value,
    $Res Function(_$SettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angleUnit = null,
    Object? displayFormat = null,
    Object? themeMode = null,
    Object? isLoaded = null,
  }) {
    return _then(
      _$SettingsStateImpl(
        angleUnit: null == angleUnit
            ? _value.angleUnit
            : angleUnit // ignore: cast_nullable_to_non_nullable
                  as AngleUnit,
        displayFormat: null == displayFormat
            ? _value.displayFormat
            : displayFormat // ignore: cast_nullable_to_non_nullable
                  as DisplayFormat,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeModePreference,
        isLoaded: null == isLoaded
            ? _value.isLoaded
            : isLoaded // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl({
    this.angleUnit = AngleUnit.degrees,
    this.displayFormat = DisplayFormat.decimal,
    this.themeMode = ThemeModePreference.system,
    this.isLoaded = false,
  });

  @override
  @JsonKey()
  final AngleUnit angleUnit;
  @override
  @JsonKey()
  final DisplayFormat displayFormat;
  @override
  @JsonKey()
  final ThemeModePreference themeMode;
  @override
  @JsonKey()
  final bool isLoaded;

  @override
  String toString() {
    return 'SettingsState(angleUnit: $angleUnit, displayFormat: $displayFormat, themeMode: $themeMode, isLoaded: $isLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.angleUnit, angleUnit) ||
                other.angleUnit == angleUnit) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.isLoaded, isLoaded) ||
                other.isLoaded == isLoaded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, angleUnit, displayFormat, themeMode, isLoaded);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState({
    final AngleUnit angleUnit,
    final DisplayFormat displayFormat,
    final ThemeModePreference themeMode,
    final bool isLoaded,
  }) = _$SettingsStateImpl;

  @override
  AngleUnit get angleUnit;
  @override
  DisplayFormat get displayFormat;
  @override
  ThemeModePreference get themeMode;
  @override
  bool get isLoaded;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
