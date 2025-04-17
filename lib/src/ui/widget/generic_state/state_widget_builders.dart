part of 'state_widget.dart';

final class StateWidgetBuilders {
  StateWidgetBuilders({
    this.emptyBuilder,
  });

  static void setDefaults({
    ActionStateBuilder? emptyBuilder,
  }) {
    TextStyle;
    if (emptyBuilder != null) _defaultEmptyBuilder = emptyBuilder;
  }

  final ActionStateBuilder? emptyBuilder;
  static ActionStateBuilder? _defaultEmptyBuilder;
  Widget getEmptyBuilder([Widget? action]) => emptyBuilder != null
      ? emptyBuilder!(action)
      : _defaultEmptyBuilder != null
          ? _defaultEmptyBuilder!(action)
          : _EmptyStateWidget(action);
}
