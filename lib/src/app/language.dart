import 'package:flutter/material.dart';
import 'package:helper/src/data/local/local.dart';
import 'package:intl/intl.dart';

class AppLanguage extends ChangeNotifier {
  AppLanguage._();
  static final AppLanguage _i = AppLanguage._();
  factory AppLanguage() => _i;

  final Locale _fallback = _AppLanguageDefaults.fallback;

  Locale _locale = _AppLanguageDefaults.fallback;
  Locale get locale => _locale;

  Future<void> changeLanguage(String languageCode) async {
    await AppPrefs.i.setString('languageCode', languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = AppPrefs.i.getString('languageCode');
    _locale = languageCode == null ? _fallback : Locale(languageCode);
    notifyListeners();
  }
}

extension _AppLanguageDefaults on AppLanguage {
  static Locale get fallback {
    final systemLocale = Intl.systemLocale;
    final languageCode =
        ['ar', 'en'].contains(systemLocale) ? systemLocale : 'en';
    return Locale(languageCode);
  }
}

extension LocaleX on Locale {
  bool get isArabic => languageCode == 'ar';
}
