import 'package:flutter/material.dart';

enum SnackBarFeedback {
  normal,
  success,
  failure;

  String _formatMessage(String value) {
    return switch (this) {
      SnackBarFeedback.normal => value,
      SnackBarFeedback.success => '$value ✅',
      SnackBarFeedback.failure => '$value ❌',
    };
  }
}

extension SnackbarContextExtension on BuildContext {
  static bool _hasActiveSnackBar = false;

  void showSnackBar(
    String message, {
    Duration? displayDuration,
    SnackBarAction? action,
    SnackBarFeedback feedback = SnackBarFeedback.normal,
    SnackBarBehaviour behaviour = SnackBarBehaviour.wait,
  }) {
    if (behaviour._isIgnore && _hasActiveSnackBar) {
      return;
    }

    if (behaviour._isReplace && _hasActiveSnackBar) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
    }

    late final SnackBar snackBar;
    if (displayDuration == null) {
      snackBar = SnackBar(
        content: Text(feedback._formatMessage(message)),
        action: action,
      );
    } else {
      snackBar = SnackBar(
        content: Text(feedback._formatMessage(message)),
        action: action,
        duration: displayDuration,
      );
    }
    final controller = ScaffoldMessenger.of(this).showSnackBar(snackBar);
    _hasActiveSnackBar = true;

    controller.closed.then((SnackBarClosedReason reason) {
      _hasActiveSnackBar = false;
    });
  }
}

enum SnackBarBehaviour {
  ignore,
  replace,
  wait;

  bool get _isIgnore => this == ignore;
  bool get _isReplace => this == replace;

  void map({
    required void Function() ignore,
    required void Function() replace,
    required void Function() wait,
  }) {
    return switch (this) {
      SnackBarBehaviour.ignore => ignore(),
      SnackBarBehaviour.replace => replace(),
      SnackBarBehaviour.wait => wait(),
    };
  }
}
