import 'package:bloc/bloc.dart';

import '../../domain/enums/angle_unit.dart';
import '../../domain/enums/display_format.dart';
import '../../domain/enums/theme_mode_preference.dart';
import '../../domain/repositories/i_settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._repository) : super(const SettingsState());

  final ISettingsRepository _repository;

  Future<void> load() async {
    final angleUnit = await _repository.loadAngleUnit();
    final displayFormat = await _repository.loadDisplayFormat();
    final themeMode = await _repository.loadThemeMode();
    emit(SettingsState(
      angleUnit: angleUnit,
      displayFormat: displayFormat,
      themeMode: themeMode,
      isLoaded: true,
    ));
  }

  Future<void> setAngleUnit(AngleUnit unit) async {
    await _repository.saveAngleUnit(unit);
    emit(state.copyWith(angleUnit: unit));
  }

  Future<void> setDisplayFormat(DisplayFormat format) async {
    await _repository.saveDisplayFormat(format);
    emit(state.copyWith(displayFormat: format));
  }

  Future<void> setThemeMode(ThemeModePreference mode) async {
    await _repository.saveThemeMode(mode);
    emit(state.copyWith(themeMode: mode));
  }
}
