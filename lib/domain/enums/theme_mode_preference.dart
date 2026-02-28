import 'package:flutter/material.dart';

enum ThemeModePreference {
  system,
  light,
  dark;

  ThemeMode get themeMode => switch (this) {
        ThemeModePreference.system => ThemeMode.system,
        ThemeModePreference.light => ThemeMode.light,
        ThemeModePreference.dark => ThemeMode.dark,
      };

  String get label => switch (this) {
        ThemeModePreference.system => 'Auto',
        ThemeModePreference.light => 'Light',
        ThemeModePreference.dark => 'Dark',
      };
}
