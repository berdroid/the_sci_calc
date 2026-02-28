enum AngleUnit {
  degrees,
  gons,
  radians;

  String get label => switch (this) {
        AngleUnit.degrees => 'DEG',
        AngleUnit.gons => 'GON',
        AngleUnit.radians => 'RAD',
      };
}
