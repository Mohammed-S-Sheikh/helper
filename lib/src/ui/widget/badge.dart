import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

class HelperBadge extends StatelessWidget {
  const HelperBadge({
    super.key,
    this.color,
    this.backgroundColor,
    required this.label,
    this.labelStyle,
  });

  final Color? color;
  final Color? backgroundColor;
  final String label;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Badge(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      label: Text(label),
      textStyle: labelStyle,
      textColor: color ?? context.colorScheme.onTertiaryContainer,
      backgroundColor: backgroundColor ?? context.colorScheme.tertiaryContainer,
    );
  }
}
