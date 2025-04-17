import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    this.padding,
    required this.value,
  });

  final EdgeInsetsGeometry? padding;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: padding != null,
      wrapper: (child) => Padding(
        padding: padding!,
        child: child,
      ),
      child: Text(
        value,
        style: context.textTheme.headlineSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
