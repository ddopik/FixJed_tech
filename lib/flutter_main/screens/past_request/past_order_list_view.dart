import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';

import 'package:flutter_base_app/flutter_main/screens/past_request/past_order_model.dart';
import 'package:flutter_base_app/flutter_main/screens/past_request/pat_orderItemView.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PastOrderListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PastOrderListViewState();
  }
}

class _PastOrderListViewState extends State<PastOrderListView> {
  final _pagingController = PagingController<int, Transaction>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    // _fetchPage(0);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    PastOrderModel().getPastOrder(
      onSuccess: (response) {
        _pagingController.appendLastPage((response as List));
        // _pagingController.appendPage(features, nextPageKey);
      },
      onError: (error) {
        _pagingController.error = error;
      },
    );

    // final newItems =
    //     await widget.repository.getArticleListPage(number: pageKey, size: 8);
    //
    // /// todo get object containg list of items and if it is last page;
    // final isLastPage = newPage.isLastPage(); // todo
    //
    // if (isLastPage) {
    //   _pagingController.appendLastPage(newItems);
    // } else {
    //   final nextPageKey = pageKey + 1;
    //   _pagingController.appendPage(newItems, nextPageKey);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
          onRefresh: () => Future.sync(
                () => _pagingController.refresh(),
              ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "PAST ORDERS",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: renderPastOrderList(),
              ),
            ]),
          )),
    );
  }

  renderPastOrderList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Transaction>(
        itemBuilder: (context, order, index) {
          return PastOrderItemView(
            request: order,
          );
        },
        firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
          error: _pagingController.error,
          onTryAgain: () => _pagingController.refresh(),
        ),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 2,
      ),
    );
  }
}
