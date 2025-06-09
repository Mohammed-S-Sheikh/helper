import 'package:flutter/material.dart';
import 'package:helper/src/ui/widget/conditional_wrapper.dart';

class LoadingFilledButton extends StatelessWidget {
  const LoadingFilledButton({
    required this.text,
    required this.onPressed,
    required this.isLoading,
    super.key,
    this.fullWidth = false,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: fullWidth,
      wrapper: (child) =>
          fullWidth ? SizedBox(width: double.infinity, child: child) : child,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              )
            : Text(text),
      ),
    );
  }
}
