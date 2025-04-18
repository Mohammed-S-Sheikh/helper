import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/consumer/consumer.dart';
import 'package:helper/src/ui/consumer/extensions.dart';
import 'package:helper/src/ui/widget/generic_state/generic_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  /// We have put it as a member to dispose it.
  late final PagingController<int, DataT> pagingController;

  /// This flag is used to dispose the [pagingController]
  /// so it does not show late initialization member error.
  bool _paginated = false;

  bool _hasMore = true;

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

          if (data is ApiResponse && data.meta != null) {
            final meta = data.meta!;

            _paginated = true;
            _hasMore = meta.hasMore;

            pagingController = PagingController<int, DataT>(
              value: PagingState<int, DataT>(
                keys: [meta.page],
                pages: [data.data],
              ),
              getNextPageKey: (state) => (state.keys?.last ?? meta.page) + 1,
              fetchPage: (pageKey) async {
                final entry = (widget.apiEntry as ApiEntry<ApiResponse>)
                    .withPageKey(pageKey);
                final response = await ApiRequest.fetchResponse(entry);
                _hasMore = response.meta!.hasMore;
                return response.data!;
              },
            );
            final delegate = PagedChildBuilderDelegate<DataT>(
              itemBuilder: (context, item, index) =>
                  widget.builder(context, item),
              noItemsFoundIndicatorBuilder: (context) =>
                  StateWidget.builders.getEmptyBuilder(),
            );
            return PagingListener(
              controller: pagingController,
              builder: (context, state, fetchNextPage) =>
                  PagedListView<int, DataT>(
                state: state.copyWith(hasNextPage: _hasMore),
                fetchNextPage: fetchNextPage,
                builderDelegate: delegate,
              ),
            );
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

  @override
  void dispose() {
    if (_paginated) {
      pagingController.dispose();
    }

    super.dispose();
  }
}
