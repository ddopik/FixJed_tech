import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/no_connection_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/requests_group.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'reqests_list_view_item.dart';

class RequestsListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestsListViewState();
  }
}

class RequestsListViewState extends State<RequestsListView> {
  final _pagingController = PagingController<int, RequestsGroup>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("RequestsListView init called");
    getRequests();

    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    Provider.of<TransactionModel>(context, listen: false)
        .getConfirmedTransactions(
      onSuccess: (response) {
        // if ((response as List).length > 0) {}
        _pagingController.appendLastPage(response);
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
        () {
          _pagingController.refresh();
          getRequests();
        },
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: french_blue,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: renderRequestList(),
            ),
          ),
        ],
      ),
    );
  }

  renderRequestList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: outer_boundary_field_space),
      child: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<RequestsGroup>(
            itemBuilder: (context, requestsGroup, index) {
              return getGroupView(requestsGroup);
            },
            firstPageErrorIndicatorBuilder: (context) =>
                getError(_pagingController.error),
            noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
            newPageErrorIndicatorBuilder: (context) {
              return getError(_pagingController.error);
            }),
        // padding: const EdgeInsets.all(16),
        // separatorBuilder: (context, index) => const SizedBox(
        //   height: 16,
        // ),
      ),
    );
  }

  Widget getGroupView(RequestsGroup requestsGroup) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(requestsGroup.date,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xffffffff),
                        )),
                new Text(
                    requestsGroup.requestList.length.toString() +
                        " " +
                        S.current.events,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xffe5e5e5).withOpacity(.3),
                        ))
              ],
            ),
          ),
          getSubView(requestsGroup.requestList, (request) async {
            await Navigator.pushNamed(context, Routes.REQUEST_CARD,
                arguments: request);
            _pagingController.refresh();
            getRequests();
          })
        ],
      ),
    );
  }

  Widget getSubView(List<Transaction> requestList, Function onClick) {
    return Column(
      children: List.generate(requestList.length, (index) {
        if (index == 0 && requestList.length > 1) {
          return RequestListViewItem(
            labelDirection: LabelDirection.TOP,
            request: requestList[index],
            onClick: onClick,
          );
        } else if (requestList.length == 1) {
          return RequestListViewItem(
            labelDirection: LabelDirection.SINGLE,
            request: requestList[index],
            onClick: onClick,
          );
        } else if (index == 0 && requestList.length == 2) {
          return RequestListViewItem(
            labelDirection: LabelDirection.TOP,
            request: requestList[index],
            onClick: onClick,
          );
        } else if (index == 1 && requestList.length == 2) {
          return RequestListViewItem(
            labelDirection: LabelDirection.MID_TOP,
            request: requestList[index],
            onClick: onClick,
          );
        } else if (index == requestList.length - 1) {
          return RequestListViewItem(
            labelDirection: LabelDirection.BOTTOM,
            request: requestList[index],
            onClick: onClick,
          );
        }
        return RequestListViewItem(
          labelDirection: LabelDirection.MID,
          request: requestList[index],
          onClick: onClick,
        );
      }),
    );
  }

  getRequests() {
    Provider.of<TransactionModel>(context, listen: false)
        .getConfirmedTransactions(
      onSuccess: (requestsGroupList) {
        _pagingController.appendLastPage(requestsGroupList);
        // _pagingController.appendPage(features, nextPageKey);
      },
      onError: (error) {
        _pagingController.error = error;
        print("getRequests ---- > ${error.toString()}");
      },
    );
  }

  Widget getError(String error) {
    if (error == "Connection failed") {
      return NoConnectionIndicator(onTryAgain: () {
        _pagingController.refresh();
        getRequests();
      });
    } else {
      return ErrorIndicator(
        error: _pagingController.error,
        onTryAgain: () {
          _pagingController.refresh();
          getRequests();
        },
      );
    }
  }
}
