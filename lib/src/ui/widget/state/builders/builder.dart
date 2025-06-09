import 'package:flutter/material.dart';
import 'package:helper/src/ui/widget/state/builders/types.dart';

final class StateBuilder {
  const StateBuilder({
    required StateBuilderType fallback,
    StateBuilderType? state,
  })  : _fallback = fallback,
        _state = state;

  final StateBuilderType _fallback;
  final StateBuilderType? _state;

  Widget builder([Widget? action]) => _state?.call(action) ?? _fallback(action);

  Widget call([Widget? action]) => builder(action);
}
