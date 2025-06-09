import 'package:flutter/material.dart'
    show BuildContext, ChangeNotifier, VoidCallback;
import 'package:helper/src/logic/data/model/model.dart';

class FeedbackNotifier extends ChangeNotifier {
  FeedbackNotifier._();
  static final FeedbackNotifier _i = FeedbackNotifier._();
  static FeedbackNotifier get i => _i;

  FeedbackModel? _feedback;

  FeedbackModel? get feedback => _i._feedback;

  void setFeedback(FeedbackModel feedback) {
    _i._feedback = feedback;
    _i.notifyListeners();
  }

  VoidCallback? _listener;

  void startListening(
    BuildContext context, {
    void Function(FeedbackModel feedback)? onFeedback,
  }) {
    if (_listener != null) {
      stopListening();
    }

    _listener = () {
      final feedback = _feedback;
      if (feedback == null) {
        return;
      }

      if (onFeedback != null) {
        onFeedback(feedback);
      } else {
        feedback.show(context);
      }
    };

    addListener(_listener!);
  }

  void stopListening() {
    removeListener(_listener!);
    _listener = null;
  }
}
