import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/settings/settings_cubit.dart';
import '../../application/settings/settings_state.dart';
import '../../domain/enums/theme_mode_preference.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return SegmentedButton<ThemeModePreference>(
          segments: ThemeModePreference.values
              .map((m) => ButtonSegment<ThemeModePreference>(
                    value: m,
                    label: Text(m.label, style: const TextStyle(fontSize: 11)),
                    icon: Icon(_iconFor(m), size: 14),
                  ))
              .toList(),
          selected: {state.themeMode},
          onSelectionChanged: (set) {
            if (set.isNotEmpty) {
              context.read<SettingsCubit>().setThemeMode(set.first);
            }
          },
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
        );
      },
    );
  }

  IconData _iconFor(ThemeModePreference m) => switch (m) {
        ThemeModePreference.system => Icons.brightness_auto,
        ThemeModePreference.light => Icons.light_mode,
        ThemeModePreference.dark => Icons.dark_mode,
      };
}
