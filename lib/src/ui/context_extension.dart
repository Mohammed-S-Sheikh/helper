import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  static bool _hasActiveSnackBar = false;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void showSnackBar(
    String message, {
    SnackBarAction? action,
    SnackBarBehaviour behaviour = SnackBarBehaviour.wait,
  }) {
    if (behaviour._isIgnore && _hasActiveSnackBar) {
      return;
    }

    if (behaviour._isReplace && _hasActiveSnackBar) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
    }

    final snackBar = SnackBar(content: Text(message), action: action);
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
