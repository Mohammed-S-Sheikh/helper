import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/src/logic/controllers/controllers.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/widget/communication/failure_feedback_behavior.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/notifiers/notifiers.dart';
import 'package:helper/src/ui/widget/actions/actions.dart';
import 'package:helper/src/ui/widget/state/builders/builders.dart';
import 'package:helper/src/ui/widget/widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef DataBuilder<DataT> = Widget Function(
  BuildContext context,
  DataController<DataT> controller,
);

class DataConsumer<DataT> extends StatefulWidget {
  const DataConsumer({
    super.key,
    this.enableRefresh = true,
    this.handleFailure = true,
    this.handleLoading = true,
    this.controller,
    this.failureBehavior = const FailureFeedbackBehavior.snackBar(),
    this.onSuccess,
    this.onFailure,
    required this.endpoint,
    required this.builder,
    this.stateBuilder,
    this.enableFeedback = true,
    this.onFeedback,
  });

  final bool enableRefresh;
  final bool handleFailure;
  final bool handleLoading;
  final DataController<DataT>? controller;
  final FailureFeedbackBehavior failureBehavior;
  final ControllerOnData<DataController<DataT>, DataT>? onSuccess;
  final ControllerOnFailure<DataController<DataT>>? onFailure;
  final Endpoint endpoint;
  final DataBuilder<DataT> builder;
  final AppStateBuilders? stateBuilder;
  final bool enableFeedback;
  final void Function(FeedbackModel feedback)? onFeedback;

  @override
  State<DataConsumer<DataT>> createState() => _DataConsumerState<DataT>();
}

class _DataConsumerState<DataT> extends State<DataConsumer<DataT>> {
  late final DataController<DataT> _controller;

  late final AppStateBuilders _stateBuilder;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ??
        DataController<DataT>(
          endpoint: widget.endpoint,
          enableMock: widget.handleLoading,
          onData: widget.onSuccess,
          onFailure: (controller, failure) {
            widget.failureBehavior.handle(context, failure);
            widget.onFailure?.call(controller, failure);
          },
        );

    if (widget.onSuccess != null) {
      _controller.setOnData(widget.onSuccess!);
    }

    if (widget.onFailure != null) {
      _controller.setOnFailure(widget.onFailure!);
    }

    if (_controller.onFailure == null && widget.handleFailure) {
      _controller.setOnFailure((controller, failure) {
        widget.failureBehavior.handle(context, failure);
      });
    }

    // If the controller was provided and has initial data, we don't request it again.
    if (_controller.data == null) {
      _controller.request();
    }

    _stateBuilder = widget.stateBuilder ?? AppStateBuilders();

    if (widget.enableFeedback) {
      FeedbackNotifier.i.startListening(
        context,
        onFeedback: widget.onFeedback,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      child: Consumer<DataController<DataT>>(
        builder: (context, controller, _) {
          Widget child = Builder(
            builder: (context) {
              if (controller.failure != null && widget.handleFailure) {
                return _getFailureWidget(controller.failure!);
              }

              if (controller.isSuccessful && controller.data == null) {
                return _stateBuilder.emptyBuilder();
              }

              return Skeletonizer(
                enabled: controller.isLoading && widget.handleLoading,
                child: widget.builder(context, controller),
              );
            },
          );

          if (widget.enableRefresh) {
            child = RefreshIndicator(
              onRefresh: () async {
                await HapticFeedback.mediumImpact();
                await _refresh();
              },
              child: child,
            );
          }

          return child;
        },
      ),
    );
  }

  Widget _getFailureWidget(Failure failure) {
    final failureWidget = _stateBuilder.fromFailure(
      _controller.failure!,
      LoadingFilledButton(
        isLoading: _controller.isLoading,
        onPressed: _refresh,
        text: context.helperL10n.retry,
      ),
    );

    final scaffoldExists = Scaffold.maybeOf(context) != null;
    return ConditionalWrapper(
      condition: !scaffoldExists,
      wrapper: (child) => Scaffold(body: child),
      child: failureWidget,
    );
  }

  Future<void> _refresh() => _controller.request();

  @override
  void dispose() {
    if (widget.enableFeedback) {
      FeedbackNotifier.i.stopListening();
    }

    _controller.dispose();

    super.dispose();
  }
}
