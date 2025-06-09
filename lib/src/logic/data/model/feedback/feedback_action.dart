part of 'feedback_model.dart';

@jSerializable
class FeedbackAction {
  const FeedbackAction({
    required this.label,
    required this.type,
  });

  final String label;
  final FeedbackActionType type;

  static void setHandlers({
    required void Function(FeedbackNavAction value) onNavigation,
  }) =>
      _FeedbackActionHandler._i.setHandlers(onNavigation: onNavigation);

  void handle() => type._handle();
}

@JUnion()
sealed class FeedbackActionType {
  const FeedbackActionType();

  const factory FeedbackActionType.navigation({
    required FeedbackNavActionBehavior behavior,
    required String destination,
  }) = FeedbackNavAction;

  void _handle();
}

class FeedbackNavAction extends FeedbackActionType {
  const FeedbackNavAction({
    required this.behavior,
    required this.destination,
  });

  final FeedbackNavActionBehavior behavior;
  final String destination;

  @override
  void _handle() => _FeedbackActionHandler._i._onNavigation(this);
}

@JEnum()
enum FeedbackNavActionBehavior {
  push,
  pop,
  replace,
  renew;
}

class _FeedbackActionHandler {
  _FeedbackActionHandler._();
  static final _FeedbackActionHandler _i = _FeedbackActionHandler._();

  void Function(FeedbackNavAction value) _onNavigation = (_) {};

  void setHandlers({
    required void Function(FeedbackNavAction value) onNavigation,
  }) {
    _onNavigation = onNavigation;
  }
}
