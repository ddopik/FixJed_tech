import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/provider/AddressProvider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'address_item_view.dart';

class AddressListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddressListViewState();
  }
}

class _AddressListViewState extends State<AddressListView> {
  AddressModel _addressModel;
  final _pagingController = PagingController<int, Address>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _addressModel = AddressModel();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    _addressModel.getSavedAddress(
        onSuccess: (savedAddress) {


          _pagingController.appendLastPage(savedAddress);

          // _pagingController.appendPage(features, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
        },
        page: nextPageKey);

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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("MainFeaturesListView ---> build() " + widget.category.name.toString() + "   " + widget.category.id.toString());

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
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: renderCartList()),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  renderCartList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Address>(
        itemBuilder: (context, address, index) {
          return AddressItemView(address: address);
        },
        firstPageErrorIndicatorBuilder: (context) =>
          EmptyListIndicator(),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }
}
