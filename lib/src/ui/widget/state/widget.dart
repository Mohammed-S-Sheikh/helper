import 'package:flutter/material.dart';
import 'package:helper/src/ui/widget/conditional_wrapper.dart';

class StateWidget extends StatelessWidget {
  const StateWidget({
    super.key,
    this.imageSize = 200,
    this.image,
    this.title,
    this.titleText,
    this.subtitle,
    this.action,
  }) : assert(
          (title == null && titleText == null) ||
              (title != null) ^ (titleText != null),
          'Either [title] or [titleText] must be provided',
        );

  final double imageSize;
  final Widget? image;
  final Widget? title;
  final String? titleText;
  final Widget? subtitle;
  final Widget? action;

  double get _titleScaping => subtitle != null ? 4 : 0;
  double get _imageScaping => subtitle != null ? 24 : 12;

  @override
  Widget build(BuildContext context) {
    bool;
    final image = this.image;
    final title = this.title;
    final subtitle = this.subtitle;
    final action = this.action;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null) ...[
            SizedBox(
              height: imageSize,
              width: imageSize,
              child: image,
            ),
            SizedBox(height: _imageScaping),
          ],
          if (title != null) ...[
            ConditionalWrapper(
              condition: textTheme.headlineSmall != null,
              wrapper: (child) => DefaultTextStyle(
                style: textTheme.headlineSmall!,
                child: child,
              ),
              child: title,
            ),
            SizedBox(height: _titleScaping),
          ],
          if (subtitle != null)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ConditionalWrapper(
                condition: textTheme.bodyMedium != null,
                wrapper: (child) => DefaultTextStyle(
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  child: child,
                ),
                child: subtitle,
              ),
            ),
          if (action != null) ...[
            const SizedBox(height: 24),
            ConditionalWrapper(
              condition: textTheme.labelLarge != null,
              wrapper: (child) => DefaultTextStyle(
                style: textTheme.labelLarge!,
                child: child,
              ),
              child: action,
            ),
          ],
        ],
      ),
    );
  }
}
