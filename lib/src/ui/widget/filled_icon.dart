import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';

class FilledIcon extends StatelessWidget {
  const FilledIcon({
    super.key,
    this.size = 24,
    required this.icon,
  });

  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Badge(
      padding: const EdgeInsets.all(8),
      backgroundColor: context.colorScheme.secondaryContainer,
      label: Icon(
        icon,
        size: size,
        color: context.colorScheme.onSecondaryContainer,
      ),
    );
  }
}
