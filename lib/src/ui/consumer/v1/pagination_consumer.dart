import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/consumer/types.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationConsumer<DataT> extends StatefulWidget {
  const PaginationConsumer({
    super.key,
    required this.apiEntry,
    required this.builder,
    this.failureBuilder,
  });

  final ApiEntry<ApiResponse<List<DataT>>> apiEntry;
  final Widget Function(
    BuildContext context,
    PagingController controller,
    DataT data,
  ) builder;
  final ConsumerFailureBuilder? failureBuilder;

  @override
  State<PaginationConsumer<DataT>> createState() =>
      _PaginationConsumerState<DataT>();
}

class _PaginationConsumerState<DataT> extends State<PaginationConsumer<DataT>> {
  late final _pagingController = PagingController<int, DataT>(
    getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
    fetchPage: (pageKey) async {
      final entry = widget.apiEntry.withPageKey(pageKey);
      final response = await ApiRequest.fetchResponse<List<DataT>>(entry);
      _hasMore = response.meta!.hasMore;
      return response.data!;
    },
  );

  bool _hasMore = true;

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) => PagedListView<int, DataT>(
          state: state.copyWith(hasNextPage: _hasMore),
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) =>
                widget.builder(context, _pagingController, item),
          ),
        ),
      ),
    );
  }
}
