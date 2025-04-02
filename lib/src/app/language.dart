import 'package:flutter/material.dart';
import 'package:helper/src/data/local/local.dart';

class AppLanguage extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> changeLanguage(String languageCode) async {
    await AppPrefs.i.setString('languageCode', languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = AppPrefs.i.getString('languageCode') ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }
}

extension LocaleX on Locale {
  bool get isArabic => languageCode == 'ar';
}
