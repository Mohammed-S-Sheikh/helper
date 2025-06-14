import 'package:flutter/material.dart';
import 'package:helper/src/logic/controllers/controllers.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/widget/communication/failure_feedback_behavior.dart';
import 'package:helper/src/ui/notifiers/notifiers.dart';
import 'package:provider/provider.dart';

class ActionConsumer<DataT> extends StatefulWidget {
  const ActionConsumer({
    super.key,
    required this.endpoint,
    required this.builder,
    this.onSuccess,
    this.failureBehavior = const FailureFeedbackBehavior.snackBar(),
    this.onFailure,
    this.enableFeedback = true,
    this.onFeedback,
  });

  final Endpoint endpoint;
  final FailureFeedbackBehavior failureBehavior;
  final ControllerOnData<ActionController<DataT>, DataT>? onSuccess;
  final ControllerOnFailure<ActionController<DataT>>? onFailure;
  final Widget Function(
    BuildContext context,
    ActionController<DataT> controller,
  ) builder;
  final bool enableFeedback;
  final void Function(FeedbackModel feedback)? onFeedback;

  @override
  State<ActionConsumer<DataT>> createState() => _ActionConsumerState<DataT>();
}

class _ActionConsumerState<DataT> extends State<ActionConsumer<DataT>> {
  late final ActionController<DataT> _controller;

  @override
  void initState() {
    super.initState();

    _controller = ActionController<DataT>(
      endpoint: widget.endpoint,
      onData: widget.onSuccess,
      onFailure: (controller, failure) {
        widget.failureBehavior.handle(context, failure);
        widget.onFailure?.call(controller, failure);
      },
    );

    if (widget.enableFeedback) {
      FeedbackNotifier.i.startListening(
        context,
        onFeedback: widget.onFeedback,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActionController<DataT>>.value(
      value: _controller,
      child: Consumer<ActionController<DataT>>(
        builder: (context, controller, _) => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: widget.builder(context, controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.enableFeedback) {
      FeedbackNotifier.i.stopListening();
    }
    super.dispose();
  }
}
