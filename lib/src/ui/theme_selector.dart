import 'package:flutter/material.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/communication/helper_theme_bottom_sheet.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  final HelperTheme _helperTheme = HelperTheme();

  @override
  void initState() {
    super.initState();
    _helperTheme.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    _helperTheme.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.theme.openThemeBottomSheet(context),
      icon: Icon(_helperTheme.mode.getThemeIcon(context)),
    );
  }
}
