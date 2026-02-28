import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';
import '../../domain/enums/theme_mode_preference.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(AngleUnit.degrees) AngleUnit angleUnit,
    @Default(DisplayFormat.decimal) DisplayFormat displayFormat,
    @Default(ThemeModePreference.system) ThemeModePreference themeMode,
    @Default(false) bool isLoaded,
  }) = _SettingsState;
}
