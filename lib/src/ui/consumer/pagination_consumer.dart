import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/ui/consumer/types.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationConsumer<DataT> extends StatefulWidget {
  const PaginationConsumer({
    super.key,
    required this.future,
    required this.builder,
    this.onFailure,
  });

  final Future<ApiResponse<List<DataT>>> Function(int page) future;

  final ConsumerDataBuilder<DataT> builder;

  final ConsumerErrorBuilder? onFailure;

  @override
  State<PaginationConsumer<DataT>> createState() =>
      _PaginationConsumerState<DataT>();
}

class _PaginationConsumerState<DataT> extends State<PaginationConsumer<DataT>> {
  late final _pagingController = PagingController<int, DataT>(
    getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
    fetchPage: (pageKey) async {
      final response = await widget.future(pageKey);
      _hasMore = response.paginationMeta!.hasMore;
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
      onRefresh: () => widget.future(1),
      child: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) => PagedListView<int, DataT>(
          state: state.copyWith(hasNextPage: _hasMore),
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) =>
                widget.builder(context, item),
          ),
        ),
      ),
    );
  }
}
