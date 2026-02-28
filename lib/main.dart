import 'package:flutter/material.dart';

import 'app.dart';
import 'infrastructure/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
