import 'package:flutter/material.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/app_bottom_sheet.dart';
import 'package:helper/src/ui/widget/filled_icon.dart';

extension ThemeDataX on ThemeData {
  Future<T?> openThemeBottomSheet<T>(BuildContext context) async {
    final AppTheme appTheme = AppTheme();

    Future<void> changeTo(ThemeMode mode) async {
      await appTheme.changeTo(mode);
      if (context.mounted) Navigator.of(context).pop();
    }

    return AppBottomSheet.show<T>(
      context,
      leading: FilledIcon(
        icon: Icons.color_lens_outlined,
        size: 36,
      ),
      title: Text('الوضع'),
      bodyPadding: const EdgeInsets.symmetric(horizontal: 8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final mode in ThemeMode.values)
              Card.filled(
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  selected: mode == appTheme.mode,
                  selectedTileColor: context.colorScheme.primaryContainer,
                  leading: Icon(mode.icon),
                  title: Text(mode.label),
                  trailing: mode == appTheme.mode ? Icon(Icons.check) : null,
                  onTap: () => changeTo(mode),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

extension on ThemeMode {
  String get label => switch (this) {
        ThemeMode.system => 'وضع النظام',
        ThemeMode.light => 'الوضع الفاتح',
        ThemeMode.dark => 'الوضع الداكن',
      };

  IconData get icon => switch (this) {
        ThemeMode.system => Icons.settings,
        ThemeMode.light => Icons.light_mode,
        ThemeMode.dark => Icons.dark_mode,
      };
}
