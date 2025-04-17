import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

final class AppTheme extends ChangeNotifier {
  AppTheme._();
  static final AppTheme _i = AppTheme._();
  factory AppTheme() => _i;

  ThemeMode get mode => _mode;
  ThemeMode _mode = ThemeMode.system;

  Future<void> changeTo(ThemeMode mode) async {
    await AppPrefs.i.setString('themeMode', mode.name);
    _mode = mode;
    notifyListeners();
  }

  Future<void> loadSavedTheme() async {
    final themeMode = AppPrefs.i.getString('themeMode');
    _mode = ThemeModeX._fromString(themeMode);
    notifyListeners();
  }
}

extension ThemeModeX on ThemeMode {
  bool get isSystem => this == ThemeMode.system;
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;

  static ThemeMode _fromString(String? value) {
    return ThemeMode.values.firstWhere(
      (v) => v.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  IconData getThemeIcon(BuildContext context) {
    IconData returnIcon(bool isLight) =>
        isLight ? Icons.light_mode : Icons.dark_mode;

    if (isSystem) {
      final Brightness brightness = MediaQuery.of(context).platformBrightness;
      return returnIcon(brightness == Brightness.light);
    } else {
      return returnIcon(isLight);
    }
  }
}
