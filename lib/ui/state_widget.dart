import 'package:flutter/material.dart';

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

  static Widget empty([Widget? action]) => _EmptyStateWidget(action);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final subtitle = this.subtitle;
    final action = this.action;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            image,
            const SizedBox(height: 32),
            Text(
              title,
              style: theme.textTheme.headlineMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 32),
              action,
            ],
          ],
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
      title: 'No Results',
      action: action,
    );
  }
}
