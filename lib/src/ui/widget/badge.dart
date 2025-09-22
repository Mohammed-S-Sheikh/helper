import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

class HelperBadge extends StatelessWidget {
  const HelperBadge({
    super.key,
    this.content,
    this.label,
    this.textColor,
    this.backgroundColor,
    this.tooltip,
  }) : assert((content != null) ^ (label != null));

  final Widget? content;
  final String? label;
  final Color? textColor;
  final String? tooltip;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Badge(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      backgroundColor: backgroundColor ?? context.colorScheme.tertiaryContainer,
      textColor: textColor ?? context.colorScheme.onTertiaryContainer,
      label: label != null ? Text(label!) : content!,
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        triggerMode: TooltipTriggerMode.tap,
        child: child,
      );
    }

    return child;
  }
}
