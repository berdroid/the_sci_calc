import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application/calculator/calculator_cubit.dart';
import '../application/history/history_cubit.dart';
import '../application/settings/settings_cubit.dart';
import '../data/mappers/expression_mapper.dart';
import '../data/mappers/history_mapper.dart';
import '../data/repositories/history_repository.dart';
import '../data/repositories/settings_repository.dart';
import '../domain/repositories/i_history_repository.dart';
import '../domain/repositories/i_settings_repository.dart';
import 'evaluation/expression_evaluator.dart';
import 'evaluation/result_formatter.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // External
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Mappers
  sl.registerLazySingleton<ExpressionMapper>(() => const ExpressionMapper());
  sl.registerLazySingleton<HistoryMapper>(
    () => HistoryMapper(sl<ExpressionMapper>()),
  );

  // Repositories
  sl.registerLazySingleton<IHistoryRepository>(
    () => HistoryRepository(sl<SharedPreferences>(), sl<HistoryMapper>()),
  );
  sl.registerLazySingleton<ISettingsRepository>(
    () => SettingsRepository(sl<SharedPreferences>()),
  );

  // Infrastructure
  sl.registerLazySingleton<ExpressionEvaluator>(
    () => const ExpressionEvaluator(),
  );
  sl.registerLazySingleton<ResultFormatter>(() => const ResultFormatter());

  // Cubits (factories so each instance is fresh)
  sl.registerFactory<CalculatorCubit>(
    () => CalculatorCubit(sl<ExpressionEvaluator>()),
  );
  sl.registerFactory<HistoryCubit>(
    () => HistoryCubit(sl<IHistoryRepository>()),
  );
  sl.registerFactory<SettingsCubit>(
    () => SettingsCubit(sl<ISettingsRepository>()),
  );
}
