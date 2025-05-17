import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

final class HelperTheme extends ChangeNotifier {
  HelperTheme._();
  static final HelperTheme _i = HelperTheme._();
  factory HelperTheme() => _i;

  ThemeMode get mode => _mode;
  ThemeMode _mode = ThemeMode.system;

  Future<void> changeTo(ThemeMode mode) async {
    await HelperPrefs.i.setString('themeMode', mode.name);
    _mode = mode;
    notifyListeners();
  }

  Future<void> loadSavedTheme() async {
    final themeMode = HelperPrefs.i.getString('themeMode');
    _mode = ThemeModeX._fromString(themeMode);
    notifyListeners();
  }
}

extension ThemeModeX on ThemeMode {
  bool get isSystem => this == ThemeMode.system;

  bool isLight(BuildContext context) {
    if (isSystem) {
      return _isSystemLight(context);
    }

    return this == ThemeMode.light;
  }

  bool isDark(BuildContext context) {
    if (isSystem) {
      return !_isSystemLight(context);
    }

    return this == ThemeMode.dark;
  }

  IconData getThemeIcon(BuildContext context) {
    return isLight(context) ? Icons.light_mode : Icons.dark_mode;
  }

  static ThemeMode _fromString(String? value) {
    return ThemeMode.values.firstWhere(
      (v) => v.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  bool _isSystemLight(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light;
  }
}
