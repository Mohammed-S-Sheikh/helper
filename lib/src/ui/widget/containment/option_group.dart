import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';

class OptionGroup extends StatelessWidget {
  const OptionGroup({
    super.key,
    this.visible = true,
    required this.options,
  });

  final bool visible;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: .4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: ListTile.divideTiles(
            color: context.colorScheme.outlineVariant,
            tiles: options,
          ).toList(),
        ),
      ),
    );
  }
}
