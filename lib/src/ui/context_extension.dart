import 'package:flutter/material.dart';
import 'package:helper/src/l10n/helper_localizations.dart';

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  HelperLocalizations get helperL10n => HelperLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}
