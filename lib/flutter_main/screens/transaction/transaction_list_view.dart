import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/provider/transaction_model.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_item_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'model/transaction.dart';



class TransactionListView extends StatefulWidget {
  final TransactionItemType transactionItemType;
  final Function onCancelTransactionClick;

  const TransactionListView(
      {Key key, this.transactionItemType, this.onCancelTransactionClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TransactionListViewState();
  }
}

class _TransactionListViewState extends State<TransactionListView> {
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
    TransactionModel().getAllTransaction(
        onSuccess: (features) {
          if ((features as List).length > 0) {}
          _pagingController.appendLastPage((features as List));
          // _pagingController.appendPage(features, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
        },
        transactionItemType: widget.transactionItemType);

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
      builderDelegate: PagedChildBuilderDelegate<Transaction>(
        itemBuilder: (context, transaction, index) {
          return TransactionItemView(
            transactionItemType: widget.transactionItemType,
            transaction: transaction,
            onCancelTransactionClick: () {},
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
