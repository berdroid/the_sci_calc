import '../enums/angle_unit.dart';
import '../enums/display_format.dart';
import '../enums/theme_mode_preference.dart';

abstract interface class ISettingsRepository {
  Future<AngleUnit> loadAngleUnit();
  Future<void> saveAngleUnit(AngleUnit unit);

  Future<DisplayFormat> loadDisplayFormat();
  Future<void> saveDisplayFormat(DisplayFormat format);

  Future<ThemeModePreference> loadThemeMode();
  Future<void> saveThemeMode(ThemeModePreference mode);
}
