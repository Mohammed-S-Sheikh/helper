import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:jserializer/jserializer.dart';

part 'feedback_action.dart';

@JEnum()
enum FeedbackPriority { banner, dialog, snackbar }

@JEnum()
enum FeedbackType { normal, failure, success }

@jSerializable
class FeedbackModel {
  const FeedbackModel({
    required this.priority,
    required this.dismissible,
    required this.type,
    this.title,
    required this.content,
    this.action,
  });

  final FeedbackPriority priority;
  final FeedbackType type;
  final bool dismissible;
  final String? title;
  final String content;
  final FeedbackAction? action;

  void show(BuildContext context) {
    final icon = switch (type) {
      FeedbackType.normal => null,
      FeedbackType.failure => Icon(Icons.warning_amber_rounded),
      FeedbackType.success => Icon(Icons.check),
    };

    final action = this.action;
    final actionBtn = action != null
        ? FilledButton(
            onPressed: () => action.handle(),
            child: Text(action.label),
          )
        : null;

    switch (priority) {
      case FeedbackPriority.banner:
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            leading: icon,
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                child: Text(context.helperL10n.dismiss),
              ),
              if (actionBtn != null) actionBtn
            ],
          ),
        );
        break;

      case FeedbackPriority.dialog:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            icon: icon,
            title: title != null ? Text(title!) : null,
            content: Text(content),
            actions: [
              if (dismissible)
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(context.helperL10n.cancel),
                ),
              if (actionBtn != null) actionBtn
            ],
          ),
        );
        break;

      case FeedbackPriority.snackbar:
        final label = switch (type) {
          FeedbackType.normal => content,
          FeedbackType.failure => '$content ❌',
          FeedbackType.success => '$content ✅',
        };

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(label),
            action: action != null
                ? SnackBarAction(
                    label: action.label,
                    onPressed: () => action.handle(),
                  )
                : null,
          ),
        );
        break;
    }
  }
}
