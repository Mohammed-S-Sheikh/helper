import 'package:flutter/material.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/communication/app_theme_bottom_sheet.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  final AppTheme _appTheme = AppTheme();

  @override
  void initState() {
    super.initState();
    _appTheme.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    _appTheme.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.theme.openThemeBottomSheet(context),
      icon: Icon(_appTheme.mode.getThemeIcon(context)),
    );
  }
}
