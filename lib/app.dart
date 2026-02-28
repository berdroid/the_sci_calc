import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/calculator/calculator_cubit.dart';
import 'application/history/history_cubit.dart';
import 'application/settings/settings_cubit.dart';
import 'application/settings/settings_state.dart';
import 'infrastructure/service_locator.dart';
import 'presentation/pages/calculator_page.dart';
import 'presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (_) => sl<SettingsCubit>(),
          lazy: false,
        ),
        BlocProvider<CalculatorCubit>(
          create: (_) => sl<CalculatorCubit>(),
        ),
        BlocProvider<HistoryCubit>(
          create: (_) => sl<HistoryCubit>()..load(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settings) {
          return MaterialApp(
            title: 'Scientific Calculator',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.themeMode.themeMode,
            home: const CalculatorPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
