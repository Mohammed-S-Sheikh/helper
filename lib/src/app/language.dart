import 'package:flutter/material.dart';
import 'package:helper/src/data/local/local.dart';
import 'package:intl/intl.dart';

class HelperLanguage extends ChangeNotifier {
  HelperLanguage._();
  static final HelperLanguage _i = HelperLanguage._();
  factory HelperLanguage() => _i;

  final Locale _fallback = _HelperLanguageDefaults.fallback;

  Locale _locale = _HelperLanguageDefaults.fallback;
  Locale get locale => _locale;

  Future<void> changeLanguage(String languageCode) async {
    await HelperPrefs.i.setString('languageCode', languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = HelperPrefs.i.getString('languageCode');
    _locale = languageCode == null ? _fallback : Locale(languageCode);
    notifyListeners();
  }
}

extension _HelperLanguageDefaults on HelperLanguage {
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
