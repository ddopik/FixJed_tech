import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/provider/AddressProvider.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/payment/add_address_dialog_view.dart';
import 'package:flutter_base_app/flutter_main/screens/login/log_in_dialog_screen.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'address_item_view.dart';

class AddressListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
                Expanded(child: renderAddressList()),
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

  renderAddressList() {
    return PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Address>(
        itemBuilder: (context, address, index) {
          if (index == _pagingController.itemList.length - 1) {
            return Column(
              children: [
                AddressItemView(
                  address: address,
                  onAddressEditClick: (address) async {
                    addNewAddressDialogView(
                        address: address,
                        context: context,
                        onAddNewAddress: () {
                          setState(() {
                            _pagingController.refresh();
                          });
                        });

                    // await Navigator.of(context).pushNamed(
                    //     Routes.ADDRESS_FORM_SCREEN,
                    //     arguments: address);
                    // _pagingController.refresh();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_outlined,
                              color: boring_green,
                            ),
                            iconSize: 25,
                            onPressed: () async {
                              addNewAddressDialogView(

                                  context: context,
                                  onAddNewAddress: () {
                                    setState(() {
                                      _pagingController.refresh();
                                    });
                                  });
                            }),
                        Text(S.of(context).addNewAddress,
                            style: const TextStyle(
                                color: french_blue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Tajawal",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ],
                )
              ],
            );
          } else {
            return AddressItemView(
              address: address,
              onAddressEditClick: (address) async {
                addNewAddressDialogView(
                  address: address,
                    context: context,
                    onAddNewAddress: () {
                      setState(() {
                        _pagingController.refresh();
                      });
                    });

                //   await Navigator.of(context)
                //       .pushNamed(Routes.ADDRESS_FORM_SCREEN, arguments: address);
                //   _pagingController.refresh();
              },
            );
          }
        },
        firstPageErrorIndicatorBuilder: (context) => EmptyListIndicator(),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(0),
      separatorBuilder: (context, index) => const SizedBox(
        height: 0,
      ),
    );
  }
}
