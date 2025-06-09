import 'package:flutter/material.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/state/builders/builder.dart';
import 'package:helper/src/ui/widget/state/builders/types.dart';
import 'package:helper/src/ui/widget/state/widget.dart';

part 'defaults.dart';
part 'extensions.dart';

final class AppStateBuilders {
  static final _defaults = StateBuilderDefaults.i;

  AppStateBuilders({
    StateBuilderType? empty,
    StateBuilderType? authFailure,
    StateBuilderType? badRequestFailure,
    StateBuilderType? conflictFailure,
    StateBuilderType? forbiddenFailure,
    StateBuilderType? internalFailure,
    StateBuilderType? networkFailure,
    StateBuilderType? notFoundFailure,
    StateBuilderType? paymentFailure,
    StateBuilderType? serverFailure,
    StateBuilderType? serviceUnavailableFailure,
    StateBuilderType? tooManyRequestsFailure,
    StateBuilderType? unauthorizedFailure,
    StateBuilderType? validationFailure,
  })  : emptyBuilder = StateBuilder(
          state: empty,
          fallback: _defaults._emptyDefault,
        ),
        authFailureBuilder = StateBuilder(
          state: authFailure,
          fallback: _defaults._authFailureDefault,
        ),
        badRequestFailureBuilder = StateBuilder(
          state: badRequestFailure,
          fallback: _defaults._badRequestFailureDefault,
        ),
        conflictFailureBuilder = StateBuilder(
          state: conflictFailure,
          fallback: _defaults._conflictFailureDefault,
        ),
        forbiddenFailureBuilder = StateBuilder(
          state: forbiddenFailure,
          fallback: _defaults._forbiddenFailureDefault,
        ),
        internalFailureBuilder = StateBuilder(
          state: internalFailure,
          fallback: _defaults._internalFailureDefault,
        ),
        networkFailureBuilder = StateBuilder(
          state: networkFailure,
          fallback: _defaults._networkFailureDefault,
        ),
        notFoundFailureBuilder = StateBuilder(
          state: notFoundFailure,
          fallback: _defaults._notFoundFailureDefault,
        ),
        paymentFailureBuilder = StateBuilder(
          state: paymentFailure,
          fallback: _defaults._paymentFailureDefault,
        ),
        serverFailureBuilder = StateBuilder(
          state: serverFailure,
          fallback: _defaults._serverFailureDefault,
        ),
        serviceUnavailableFailureBuilder = StateBuilder(
          state: serviceUnavailableFailure,
          fallback: _defaults._serviceUnavailableFailureDefault,
        ),
        tooManyRequestsFailureBuilder = StateBuilder(
          state: tooManyRequestsFailure,
          fallback: _defaults._tooManyRequestsFailureDefault,
        ),
        unauthorizedFailureBuilder = StateBuilder(
          state: unauthorizedFailure,
          fallback: _defaults._unauthorizedFailureDefault,
        ),
        validationFailureBuilder = StateBuilder(
          state: validationFailure,
          fallback: _defaults._validationFailureDefault,
        );

  final StateBuilder emptyBuilder;
  final StateBuilder authFailureBuilder;
  final StateBuilder badRequestFailureBuilder;
  final StateBuilder conflictFailureBuilder;
  final StateBuilder forbiddenFailureBuilder;
  final StateBuilder internalFailureBuilder;
  final StateBuilder networkFailureBuilder;
  final StateBuilder notFoundFailureBuilder;
  final StateBuilder paymentFailureBuilder;
  final StateBuilder serverFailureBuilder;
  final StateBuilder serviceUnavailableFailureBuilder;
  final StateBuilder tooManyRequestsFailureBuilder;
  final StateBuilder unauthorizedFailureBuilder;
  final StateBuilder validationFailureBuilder;

  Widget fromFailure(Failure failure, [Widget? action]) {
    return switch (failure) {
      Failure.auth => authFailureBuilder(action),
      Failure.badRequest => badRequestFailureBuilder(action),
      Failure.conflict => conflictFailureBuilder(action),
      Failure.forbidden => forbiddenFailureBuilder(action),
      Failure.internal => internalFailureBuilder(action),
      Failure.network => networkFailureBuilder(action),
      Failure.notFound => notFoundFailureBuilder(action),
      Failure.payment => paymentFailureBuilder(action),
      Failure.server => serverFailureBuilder(action),
      Failure.serviceUnavailable => serviceUnavailableFailureBuilder(action),
      Failure.tooManyRequests => tooManyRequestsFailureBuilder(action),
      Failure.unauthorized => unauthorizedFailureBuilder(action),
      Failure.validation => validationFailureBuilder(action),
      Failure() => internalFailureBuilder(action),
    };
  }
}
