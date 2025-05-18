import 'package:flutter/material.dart';
import 'package:helper/src/ui/ui.dart';
import 'package:helper/src/ui/widget/generic_state/types.dart';

part 'state_widget_builders.dart';

class StateWidget extends StatelessWidget {
  const StateWidget({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    this.action,
  });

  final Widget image;
  final String title;
  final String? subtitle;
  final Widget? action;

  static StateWidgetBuilders get builders => StateWidgetBuilders();

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    final action = this.action;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            children: [
              image,
              const SizedBox(height: 24),
              Text(
                title,
                style: context.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              if (action != null) ...[
                const SizedBox(height: 32),
                action,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget([this.action]);

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      image: Icon(
        Icons.abc,
        size: 100,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: context.helperL10n.noResults,
      action: action,
    );
  }
}
