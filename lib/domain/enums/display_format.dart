enum DisplayFormat {
  decimal,
  scientific,
  engineering,
  dms,
  rational;

  String get label => switch (this) {
        DisplayFormat.decimal => 'DEC',
        DisplayFormat.scientific => 'SCI',
        DisplayFormat.engineering => 'ENG',
        DisplayFormat.dms => 'DMS',
        DisplayFormat.rational => 'FRAC',
      };
}
