import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';

abstract final class HelperDialog {
  static Future<T?> action<T>(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? subtitle,
    Widget? content,
    String? confirmText,
    String? cancelText,
    required FutureOr<void> Function()? onConfirm,
  }) async {
    assert(
      !(subtitle != null && content != null),
      'Either content or subtitle must be provided, but not both.',
    );

    bool loading = false;
    return showDialog<T>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              icon: icon,
              title: title == null ? null : Text(title),
              content: subtitle != null ? Text(subtitle) : content,
              actions: [
                TextButton(
                  onPressed: loading ? null : Navigator.of(context).pop,
                  child: Text(cancelText ?? context.helperL10n.cancel),
                ),
                FilledButton(
                  onPressed: loading
                      ? null
                      : () async {
                          setState(() => loading = true);
                          await onConfirm?.call();
                          setState(() => loading = false);
                        },
                  child: loading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(confirmText ?? context.helperL10n.confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Future<T?> info<T>(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? subtitle,
    Widget? content,
    String? confirmText,
    VoidCallback? onConfirm,
  }) async {
    assert(
      !(subtitle != null && content != null),
      'Either content or subtitle must be provided, but not both.',
    );

    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        icon: icon,
        title: title == null ? null : Text(title),
        content: subtitle != null ? Text(subtitle) : content,
        actions: [
          FilledButton(
            onPressed: onConfirm ?? () => Navigator.of(context).pop(),
            child: Text(confirmText ?? context.helperL10n.confirm),
          ),
        ],
      ),
    );
  }
}
