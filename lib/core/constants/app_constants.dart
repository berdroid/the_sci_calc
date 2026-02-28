class AppConstants {
  const AppConstants._();

  static const int maxHistoryEntries = 20;
  static const int maxSignificantDigits = 15;
  static const int maxRationalDenominator = 1000000; // 10^6 cap for continued-fraction approx
  static const double wideLayoutBreakpoint = 600.0;
  static const double historyPanelWidth = 280.0;
}
