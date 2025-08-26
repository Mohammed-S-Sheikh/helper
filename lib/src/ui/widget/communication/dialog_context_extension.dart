import 'dart:async' show FutureOr;

import 'package:flutter/material.dart';
import 'package:helper/src/ui/widget/communication/helper_dialog.dart';

extension DialogContextExtension on BuildContext {
  Future<T?> showHelperActionDialog<T>({
    Widget? icon,
    String? title,
    String? subtitle,
    Widget? content,
    String? confirmText,
    String? cancelText,
    required FutureOr<void> Function()? onConfirm,
  }) {
    return HelperDialog.action<T>(
      this,
      icon: icon,
      title: title,
      subtitle: subtitle,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
    );
  }

  Future<T?> showHelperInfoDialog<T>({
    Widget? icon,
    String? title,
    String? subtitle,
    Widget? content,
    String? confirmText,
    required FutureOr<void> Function()? onConfirm,
  }) {
    return HelperDialog.info<T>(
      this,
      icon: icon,
      title: title,
      subtitle: subtitle,
      content: content,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }
}
