import 'package:flutter/material.dart' show Widget, runApp;
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/logic/data/local/prefs.dart';
import 'package:helper/src/logic/data/network/api.dart';

Future<void> appRunner({
  required String baseUrl,
  Map<String, dynamic> Function()? extraHeaders,
  required void Function()? on401,
  required Widget app,
}) async {
  await HelperPrefs.initialize();
  await HelperLanguage().loadSavedLanguage();
  await HelperTheme().loadSavedTheme();
  Api.initialize(
    baseUrl: baseUrl,
    extraHeaders: extraHeaders,
    on401: on401,
  );

  runApp(app);
}
