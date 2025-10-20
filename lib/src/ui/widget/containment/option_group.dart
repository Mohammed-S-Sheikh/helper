import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';

class OptionGroup extends StatelessWidget {
  const OptionGroup({
    super.key,
    this.visible = true,
    required this.options,
    this.borderColor,
    this.backgroundColor,
  });

  final bool visible;
  final List<Widget> options;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colorScheme.surface,
          border: Border.all(
            color:
                borderColor ?? context.colorScheme.outlineVariant.withAlpha(50),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: ListTile.divideTiles(
            color: borderColor ?? context.colorScheme.outlineVariant,
            tiles: options,
          ).toList(),
        ),
      ),
    );
  }
}
