import 'package:flutter/material.dart' show BuildContext;
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/ui/widget/communication/communication.dart';

abstract class FailureFeedbackBehavior {
  const FailureFeedbackBehavior._();

  const factory FailureFeedbackBehavior.noFeedback() =
      _FailureNoFeedbackBehavior;

  const factory FailureFeedbackBehavior.snackBar() = _FailureSnackBarBehavior;

  const factory FailureFeedbackBehavior.custom(
    void Function(BuildContext context, Failure failure) onFailure,
  ) = _FailureCustomBehavior;

  void handle(BuildContext context, Failure failure);
}

final class _FailureNoFeedbackBehavior extends FailureFeedbackBehavior {
  const _FailureNoFeedbackBehavior() : super._();

  @override
  void handle(BuildContext context, Failure failure) {}
}

final class _FailureSnackBarBehavior extends FailureFeedbackBehavior {
  const _FailureSnackBarBehavior() : super._();

  @override
  void handle(BuildContext context, Failure failure) =>
      context.showSnackBar(failure.message(context));
}

final class _FailureCustomBehavior extends FailureFeedbackBehavior {
  const _FailureCustomBehavior(this._onFailure) : super._();

  final void Function(BuildContext context, Failure failure) _onFailure;

  @override
  void handle(BuildContext context, Failure failure) =>
      _onFailure(context, failure);
}
