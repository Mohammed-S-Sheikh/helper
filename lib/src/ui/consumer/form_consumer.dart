import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:helper/src/logic/controllers/controllers.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/widget/communication/failure_feedback_behavior.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/notifiers/notifiers.dart';
import 'package:helper/src/ui/widget/conditional_wrapper.dart';

part 'form_submit_button.dart';

class FormConsumer<DataT> extends StatefulWidget {
  const FormConsumer({
    super.key,
    required this.endpoint,
    this.alertUnsavedChanges = false,
    this.padding,
    this.failureBehavior = const FailureFeedbackBehavior.snackBar(),
    required this.onSuccess,
    this.onFailure,
    this.spacing = 0,
    required this.children,
    this.enableFeedback = true,
    this.onFeedback,
  });

  final Endpoint endpoint;
  final bool alertUnsavedChanges;
  final EdgeInsetsGeometry? padding;
  final FailureFeedbackBehavior failureBehavior;
  final ControllerOnData<FormController<DataT>, DataT>? onSuccess;
  final ControllerOnFailure<FormController<DataT>>? onFailure;
  final double spacing;
  final List<Widget> Function(
    BuildContext context,
    FormController<DataT> controller,
  ) children;
  final bool enableFeedback;
  final void Function(FeedbackModel feedback)? onFeedback;

  @override
  State<FormConsumer<DataT>> createState() => _FormConsumerState<DataT>();

  static FormController of(BuildContext context) =>
      _FormControllerProvider.of(context);
}

class _FormConsumerState<DataT> extends State<FormConsumer<DataT>> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  late final FormController<DataT> _controller;

  FormBuilderState get _state => _formKey.currentState!;

  @override
  void initState() {
    super.initState();

    _controller = FormController<DataT>(
      _formKey,
      endpoint: widget.endpoint,
      onData: widget.onSuccess,
      onFailure: (controller, failure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.failureBehavior.handle(context, failure);
        });
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
    return _FormControllerProvider(
      controller: _controller,
      child: Builder(
        builder: (context) {
          _FormControllerProvider.of(context);
          return FormBuilder(
            key: _formKey,
            enabled: !_controller.isLoading,
            canPop: !widget.alertUnsavedChanges,
            onPopInvokedWithResult: _onPopInvokedWithResult,
            child: Column(
              spacing: widget.spacing,
              children: widget.children(context, _controller),
            ),
          );
        },
      ),
    );
  }

  void _onPopInvokedWithResult(bool didPop, Object? result) async {
    if (didPop || !widget.alertUnsavedChanges) return;
    if (!_state.isDirty) return Navigator.of(context).pop();
    _showUnsavedChangesDialog();
  }

  void _showUnsavedChangesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.helperL10n.unsavedChanges),
        content: Text(context.helperL10n.unsavedChangesWarning),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(context.helperL10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text(context.helperL10n.leave),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.enableFeedback) {
      FeedbackNotifier.i.stopListening();
    }
    _controller.dispose();

    super.dispose();
  }
}

class _FormControllerProvider extends InheritedNotifier<FormController> {
  const _FormControllerProvider({
    required FormController controller,
    required super.child,
  }) : super(notifier: controller);

  static FormController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_FormControllerProvider>();
    assert(provider != null, 'No FormControllerProvider found in context');
    return provider!.notifier!;
  }
}
