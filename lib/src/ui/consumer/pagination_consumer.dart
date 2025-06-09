import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/notifiers/notifiers.dart';
import 'package:helper/src/ui/widget/actions/actions.dart';
import 'package:helper/src/ui/widget/state/builders/builders.dart';
import 'package:helper/src/ui/widget/widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jserializer/jserializer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaginationController<DataT> extends ChangeNotifier {
  void refresh() => notifyListeners();
}

class PaginationConsumer<DataT> extends StatefulWidget {
  const PaginationConsumer({
    super.key,
    this.controller,
    this.expanded = false,
    this.enableRefresh = true,
    required this.endpoint,
    required this.builder,
    this.stateBuilder,
    this.enableFeedback = true,
    this.onFeedback,
  })  : gridDelegate = null,
        separatorBuilder = null;

  const PaginationConsumer.separated({
    super.key,
    this.controller,
    this.expanded = false,
    this.enableRefresh = true,
    required this.endpoint,
    required this.builder,
    this.stateBuilder,
    this.enableFeedback = true,
    this.onFeedback,
    required Widget Function(BuildContext, int) this.separatorBuilder,
  }) : gridDelegate = null;

  const PaginationConsumer.grid({
    super.key,
    this.controller,
    this.expanded = false,
    this.enableRefresh = true,
    required this.endpoint,
    required this.builder,
    this.stateBuilder,
    this.enableFeedback = true,
    this.onFeedback,
    required SliverGridDelegate this.gridDelegate,
  }) : separatorBuilder = null;

  final PaginationController<DataT>? controller;
  final bool expanded;
  final bool enableRefresh;
  final Endpoint endpoint;
  final Widget Function(BuildContext context, DataT item) builder;
  final AppStateBuilders? stateBuilder;
  final bool enableFeedback;
  final void Function(FeedbackModel feedback)? onFeedback;

  final SliverGridDelegate? gridDelegate;
  final Widget Function(BuildContext, int)? separatorBuilder;

  @override
  State<PaginationConsumer<DataT>> createState() =>
      _PaginationConsumerState<DataT>();
}

class _PaginationConsumerState<DataT> extends State<PaginationConsumer<DataT>> {
  late final PagingController<int, DataT> _controller;

  bool _hasMore = true;

  late bool shouldLoadNextPage = false;

  late final AppStateBuilders _stateBuilder;

  @override
  void initState() {
    super.initState();

    widget.controller?.addListener(_refresh);

    _controller = PagingController<int, DataT>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) async {
        final endpoint = widget.endpoint.copyWithPage(pageKey);
        final response = await Api.request<List<DataT>>(endpoint);

        final meta = response.meta!;
        final currentPage = meta['current_page'] as int;
        final lastPage = meta['last_page'] as int;
        _hasMore = currentPage < lastPage;

        return response.data!;
      },
    );

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
    late final Widget Function(
      BuildContext context,
      PagingState<int, DataT> state,
      void Function() fetchNextPage,
    ) builder;
    if (widget.gridDelegate != null) {
      builder = (context, state, fetchNextPage) => PagedGridView(
            state: state.copyWith(hasNextPage: _hasMore),
            fetchNextPage: fetchNextPage,
            builderDelegate: _delegate,
            gridDelegate: widget.gridDelegate!,
          );
    } else if (widget.separatorBuilder != null) {
      builder = (context, state, fetchNextPage) =>
          PagedListView<int, DataT>.separated(
            state: state.copyWith(hasNextPage: _hasMore),
            fetchNextPage: fetchNextPage,
            builderDelegate: _delegate,
            separatorBuilder: widget.separatorBuilder!,
          );
    } else {
      builder = (context, state, fetchNextPage) => PagedListView<int, DataT>(
            state: state.copyWith(hasNextPage: _hasMore),
            fetchNextPage: fetchNextPage,
            builderDelegate: _delegate,
          );
    }

    Widget child = PagingListener(
      controller: _controller,
      builder: builder,
    );

    if (widget.enableRefresh) {
      child = RefreshIndicator(
        onRefresh: () async {
          await HapticFeedback.mediumImpact();
          _refresh();
        },
        child: child,
      );
    }

    if (widget.enableRefresh) {
      child = Expanded(child: child);
    }

    return child;
  }

  PagedChildBuilderDelegate<DataT> get _delegate {
    return PagedChildBuilderDelegate<DataT>(
      noItemsFoundIndicatorBuilder: (context) => _stateBuilder.emptyBuilder(),
      firstPageErrorIndicatorBuilder: (context) => ConditionalWrapper(
        condition: Scaffold.maybeOf(context) == null,
        wrapper: (child) => Scaffold(body: child),
        child: _stateBuilder.fromFailure(
          Failure.fromException(_controller.error!),
          LoadingFilledButton(
            isLoading: _controller.isLoading,
            onPressed: _refresh,
            text: context.helperL10n.retry,
          ),
        ),
      ),
      firstPageProgressIndicatorBuilder: (context) {
        final mockerContext = JMockerContext(
          nullifyAfterDepth: 12,
          options: {
            'list': {'maxCount': 12},
          },
        )..setCallCount(10);
        final mockData =
            JSerializer.createMock<List<DataT>>(context: mockerContext);
        return Skeletonizer(
          child: Column(
            spacing: 8,
            children: [
              for (final data in mockData) widget.builder(context, data),
            ],
          ),
        );
      },
      itemBuilder: (context, item, index) => widget.builder(context, item),
    );
  }

  void _refresh() => _controller.refresh();

  @override
  void dispose() {
    widget.controller?.removeListener(_refresh);

    _controller.dispose();

    if (widget.enableFeedback) {
      FeedbackNotifier.i.stopListening();
    }

    super.dispose();
  }
}
