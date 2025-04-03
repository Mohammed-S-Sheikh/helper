import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/ui/consumer/consumer.dart';
import 'package:helper/src/ui/widget/widget.dart';

class FutureConsumer<DataT> extends StatefulWidget {
  const FutureConsumer({
    super.key,
    required this.future,
    required this.builder,
    this.onFailure,
  });

  final Future<DataT> Function() future;

  final ConsumerDataBuilder<DataT> builder;

  final ConsumerErrorBuilder? onFailure;

  @override
  State<FutureConsumer<DataT>> createState() => _FutureConsumerState<DataT>();
}

class _FutureConsumerState<DataT> extends State<FutureConsumer<DataT>> {
  Future<DataT>? _future;

  @override
  void initState() {
    _future = widget.future();
    super.initState();
  }

  Widget Function(ResponseFailure failure) get _failureBuilder {
    return widget.onFailure == null
        ? (failure) => Text(failure.message)
        : (failure) => widget.onFailure!(context, failure);
  }

  @override
  Widget build(BuildContext context) {
    Widget wrapper(Widget child) =>
        Scaffold(body: Center(child: CircularProgressIndicator()));

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) => snapshot.map(
        loading: () => wrapper(CircularProgressIndicator()),
        loaded: (data) {
          if (data is Iterable && data.isEmpty) {
            return wrapper(StateWidget.empty());
          }

          return widget.builder(context, data);
        },
        failed: _failureBuilder,
      ),
    );
  }
}

extension<DataT> on AsyncSnapshot<DataT> {
  ResultT map<ResultT>({
    required ResultT Function() loading,
    required ResultT Function(DataT data) loaded,
    required ResultT Function(ResponseFailure failure) failed,
  }) {
    if (connectionState.loading) {
      return loading();
    }

    if (hasError) {
      final failure = ResponseFailure.fromException(error!);
      return failed(failure);
    }

    return loaded(data as DataT);
  }
}

extension on ConnectionState {
  bool get loading =>
      this == ConnectionState.waiting || this == ConnectionState.none;
}
