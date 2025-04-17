import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/consumer/consumer.dart';
import 'package:helper/src/ui/consumer/extensions.dart';
import 'package:helper/src/ui/widget/generic_state/generic_state.dart';

class DataConsumer<DataT> extends StatefulWidget {
  const DataConsumer({
    super.key,
    this.refreshIndicator = true,
    required this.apiEntry,
    required this.builder,
    this.failureBuilder,
  });

  final bool refreshIndicator;
  final ApiEntry<DataT> apiEntry;
  final ConsumerDataBuilder<DataT> builder;
  final ConsumerFailureBuilder? failureBuilder;

  @override
  State<DataConsumer<DataT>> createState() => _DataConsumerState<DataT>();
}

class _DataConsumerState<DataT> extends State<DataConsumer<DataT>> {
  Future<DataT>? _future;

  @override
  void initState() {
    _request();
    super.initState();
  }

  Future<void> _request() => _future = ApiRequest.fetch(widget.apiEntry);

  Widget Function(ResponseFailure failure) get _failureBuilder {
    return widget.failureBuilder == null
        ? (failure) => Text(failure.message)
        : (failure) => widget.failureBuilder!(context, failure);
  }

  @override
  Widget build(BuildContext context) {
    Widget wrapper(Widget child) => Scaffold(body: Center(child: child));

    Widget child = FutureBuilder(
      future: _future,
      builder: (context, snapshot) => snapshot.map(
        loading: () => wrapper(CircularProgressIndicator()),
        loaded: (data) {
          if (data is Iterable && data.isEmpty) {
            return wrapper(StateWidget.builders.getEmptyBuilder());
          }

          return widget.builder(context, data);
        },
        failed: _failureBuilder,
      ),
    );

    if (widget.refreshIndicator) {
      child = RefreshIndicator(
        onRefresh: _request,
        child: child,
      );
    }

    return child;
  }
}
