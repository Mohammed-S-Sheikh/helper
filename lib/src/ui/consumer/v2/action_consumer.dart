import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helper/src/data/model/failure.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/widget/communication/communication.dart';

class ActionConsumer<T> extends StatelessWidget {
  const ActionConsumer({
    super.key,
    required this.apiEntry,
    required this.builder,
    this.onFailure,
    required this.onSuccess,
  });

  final ApiEntry<T> apiEntry;
  final Widget Function(
    BuildContext context,
    FutureOr<void> Function([Object? data]) submit,
  ) builder;
  final void Function(ResponseFailure failure)? onFailure;
  final void Function(T data) onSuccess;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ([Object? data]) async {
        final entry = data != null ? apiEntry.copyWith(body: data) : apiEntry;
        final response = await ApiRequest.fetchEither<T>(entry);
        response.fold(
          (l) {
            if (onFailure != null) {
              onFailure!(l);
            } else {
              context.showSnackBar(l.message);
            }
          },
          onSuccess,
        );
      },
    );
  }
}
