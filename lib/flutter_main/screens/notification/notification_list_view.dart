import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/screens/notification/provider/notification_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'model/fix_jed_notification.dart';
import 'notificationItemView.dart';

class NotificationListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationListViewState();
  }
}

class _NotificationListViewState extends State<NotificationListView> {
  final _pagingController = PagingController<int, FixJedNotification>(
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
    NotificationModel().getNotification(
      onSuccess: (response) {
        if ((response as List).length > 0) {}
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
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: renderTransactionList(),
            ),
          ),
        ],
      ),
    );
  }

  renderTransactionList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FixJedNotification>(
        itemBuilder: (context, notification, index) {
          return GestureDetector(
            child: NotificationItemView(notification: notification),
            onTap: () {},
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
        height: 16,
      ),
    );
  }
}
