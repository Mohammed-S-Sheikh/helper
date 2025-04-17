import 'package:flutter/material.dart'
    show Widget, WidgetsFlutterBinding, runApp;
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/data/local/prefs.dart';

Future<void> appRunner(Widget app) async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPrefs.initialize();
  await AppLanguage().loadSavedLanguage();
  await AppTheme().loadSavedTheme();

  runApp(app);
}
