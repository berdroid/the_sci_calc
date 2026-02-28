import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';
import '../../domain/enums/theme_mode_preference.dart';
import '../../domain/repositories/i_settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  SettingsRepository(this._prefs);

  final SharedPreferences _prefs;

  static const _keyAngleUnit = 'settings_angle_unit';
  static const _keyDisplayFormat = 'settings_display_format';
  static const _keyThemeMode = 'settings_theme_mode';

  @override
  Future<AngleUnit> loadAngleUnit() async {
    final s = _prefs.getString(_keyAngleUnit);
    if (s == null) return AngleUnit.degrees;
    return AngleUnit.values.firstWhere(
      (e) => e.name == s,
      orElse: () => AngleUnit.degrees,
    );
  }

  @override
  Future<void> saveAngleUnit(AngleUnit unit) =>
      _prefs.setString(_keyAngleUnit, unit.name);

  @override
  Future<DisplayFormat> loadDisplayFormat() async {
    final s = _prefs.getString(_keyDisplayFormat);
    if (s == null) return DisplayFormat.decimal;
    return DisplayFormat.values.firstWhere(
      (e) => e.name == s,
      orElse: () => DisplayFormat.decimal,
    );
  }

  @override
  Future<void> saveDisplayFormat(DisplayFormat format) =>
      _prefs.setString(_keyDisplayFormat, format.name);

  @override
  Future<ThemeModePreference> loadThemeMode() async {
    final s = _prefs.getString(_keyThemeMode);
    if (s == null) return ThemeModePreference.system;
    return ThemeModePreference.values.firstWhere(
      (e) => e.name == s,
      orElse: () => ThemeModePreference.system,
    );
  }

  @override
  Future<void> saveThemeMode(ThemeModePreference mode) =>
      _prefs.setString(_keyThemeMode, mode.name);
}
