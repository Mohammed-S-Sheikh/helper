import 'package:flutter/material.dart'
    show Widget, WidgetsFlutterBinding, runApp;
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/logic/data/local/prefs.dart';

Future<void> appRunner(Widget app) async {
  WidgetsFlutterBinding.ensureInitialized();

  await HelperPrefs.initialize();
  await HelperLanguage().loadSavedLanguage();
  await HelperTheme().loadSavedTheme();

  runApp(app);
}
