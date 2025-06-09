part of 'app_state_builders.dart';

final class StateBuilderDefaults {
  static final StateBuilderDefaults i = StateBuilderDefaults._();
  StateBuilderDefaults._();

  static void overrideDefaults({
    StateBuilderType? emptyDefault,
    StateBuilderType? authFailureDefault,
    StateBuilderType? badRequestFailureDefault,
    StateBuilderType? conflictFailureDefault,
    StateBuilderType? forbiddenFailureDefault,
    StateBuilderType? internalFailureDefault,
    StateBuilderType? networkFailureDefault,
    StateBuilderType? notFoundFailureDefault,
    StateBuilderType? paymentFailureDefault,
    StateBuilderType? serverFailureDefault,
    StateBuilderType? serviceUnavailableFailureDefault,
    StateBuilderType? tooManyRequestsFailureDefault,
    StateBuilderType? unauthorizedFailureDefault,
    StateBuilderType? validationFailureDefault,
  }) {
    if (emptyDefault != null) {
      i._emptyDefault = emptyDefault;
    }
    if (authFailureDefault != null) {
      i._authFailureDefault = authFailureDefault;
    }
    if (badRequestFailureDefault != null) {
      i._badRequestFailureDefault = badRequestFailureDefault;
    }
    if (conflictFailureDefault != null) {
      i._conflictFailureDefault = conflictFailureDefault;
    }
    if (forbiddenFailureDefault != null) {
      i._forbiddenFailureDefault = forbiddenFailureDefault;
    }
    if (internalFailureDefault != null) {
      i._internalFailureDefault = internalFailureDefault;
    }
    if (networkFailureDefault != null) {
      i._networkFailureDefault = networkFailureDefault;
    }
    if (notFoundFailureDefault != null) {
      i._notFoundFailureDefault = notFoundFailureDefault;
    }
    if (paymentFailureDefault != null) {
      i._paymentFailureDefault = paymentFailureDefault;
    }
    if (serverFailureDefault != null) {
      i._serverFailureDefault = serverFailureDefault;
    }
    if (serviceUnavailableFailureDefault != null) {
      i._serviceUnavailableFailureDefault = serviceUnavailableFailureDefault;
    }
    if (tooManyRequestsFailureDefault != null) {
      i._tooManyRequestsFailureDefault = tooManyRequestsFailureDefault;
    }
    if (unauthorizedFailureDefault != null) {
      i._unauthorizedFailureDefault = unauthorizedFailureDefault;
    }
    if (validationFailureDefault != null) {
      i._validationFailureDefault = validationFailureDefault;
    }
  }

  StateBuilderType _emptyDefault = ([action]) => _EmptyStateWidget(action);

  StateBuilderType _authFailureDefault =
      ([action]) => _FailureWidget(const Failure.auth(), action);
  StateBuilderType _badRequestFailureDefault =
      ([action]) => _FailureWidget(const Failure.badRequest(), action);
  StateBuilderType _conflictFailureDefault =
      ([action]) => _FailureWidget(const Failure.conflict(), action);
  StateBuilderType _forbiddenFailureDefault =
      ([action]) => _FailureWidget(const Failure.forbidden(), action);
  StateBuilderType _internalFailureDefault =
      ([action]) => _FailureWidget(const Failure.internal(), action);
  StateBuilderType _networkFailureDefault =
      ([action]) => _FailureWidget(const Failure.network(), action);
  StateBuilderType _notFoundFailureDefault =
      ([action]) => _FailureWidget(const Failure.notFound(), action);
  StateBuilderType _paymentFailureDefault =
      ([action]) => _FailureWidget(const Failure.payment(), action);
  StateBuilderType _serverFailureDefault =
      ([action]) => _FailureWidget(const Failure.server(), action);
  StateBuilderType _serviceUnavailableFailureDefault =
      ([action]) => _FailureWidget(const Failure.serviceUnavailable(), action);
  StateBuilderType _tooManyRequestsFailureDefault =
      ([action]) => _FailureWidget(const Failure.tooManyRequests(), action);
  StateBuilderType _unauthorizedFailureDefault =
      ([action]) => _FailureWidget(const Failure.unauthorized(), action);
  StateBuilderType _validationFailureDefault =
      ([action]) => _FailureWidget(const Failure.validation({}), action);
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget([this.action]);

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      image: Icon(Icons.cancel_outlined),
      title: Text(context.helperL10n.noResults),
      action: action,
    );
  }
}

class _FailureWidget extends StatelessWidget {
  const _FailureWidget(this.failure, [this.action]);

  final Widget? action;
  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      image: failure.image,
      title: Text(failure.message(context)),
      action: action,
    );
  }
}
