import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/cart/model/cart_response.dart';
import 'package:flutter_base_app/flutter_main/screens/cart/provider/cart_model.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/product_model.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'cart_item_view.dart';
import 'delete_confirm_dialog.dart';

// ignore: must_be_immutable
class CartListView extends StatefulWidget {
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  ProductModel _productModel;
  CartModel _cartModel;
  var totalCartPrice = 0;

  final _pagingController = PagingController<int, FixJedCategory>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _productModel = ProductModel();
    _cartModel = CartModel();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    CartModel().getCartProduct(
        onSuccess: (features) {

          if(features != null) {
            CartResponse cartResponse = features;
            setState(() {
              totalCartPrice = cartResponse.cartTotalPrice;
            });
            _pagingController.appendLastPage(cartResponse.categories);
          }else{
            _pagingController.appendLastPage([]);
          }
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
                (totalCartPrice > 0)
                    ? Container(
                        child: customActionButton(
                            width: MediaQuery.of(context).size.width * .77,
                            height: 45,
                            btnColor: boring_green,
                            textColor: Color(0xffffffff),
                            btnText: S.current.pay +
                                " ( " +
                                getPrice(context, totalCartPrice) +
                                " )",
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Routes.PAYMENT_SCREEN,
                                  arguments: totalCartPrice);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 0)
                          ],
                        ),
                      )
                    : Container(),
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
      builderDelegate: PagedChildBuilderDelegate<FixJedCategory>(
        itemBuilder: (context, category, index) {
          return CarItemView(
            category: category,
            onAddQuantity: addProductQuantityToCart,
            onRemoveQuantity: subtractProductFromCart,
            onRemoveProduct: removeProductFromCart,
            onRemoveCategory: removeCategoryFromCartDialog,
            onAddNEwCategory: onAddNEwCategory,
          );
        },
        firstPageErrorIndicatorBuilder: (context) =>
            Provider.of<AppModel>(context).isUserLoggedIn()
                ? ErrorIndicator(
                    error: _pagingController.error,
                    onTryAgain: () => _pagingController.refresh(),
                  )
                : EmptyListIndicator(),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }

  addProductQuantityToCart(int productId) {
    showLoading(context);

    _productModel.addProductToCart(
        onSuccess: (response) {
          dismissLoading();
          _pagingController.refresh();
          // setState(() {
          //   _pagingController.itemList = _pagingController.itemList.map((e) {
          //
          //     print("current selected id = $productId" +
          //         "/ current map id =" +
          //         e.category.id.toString());
          //     if (e.category.id == productId) {
          //       print("Found Match --->" + productId.toString());
          //       e.count++;
          //     }
          //     return e;
          //   }).toList();
          // });
        },
        onError: (message) {
          dismissLoading();
          showError(message);
        },
        productID: productId);
  }

  subtractProductFromCart(productId) {
    showLoading(context);
    _productModel.subtractProductFromCart(
        onSuccess: (response) {
          dismissLoading();
          var setRefresh = false;
          _pagingController.refresh();
          // setState(() {
          //   _pagingController.itemList = _pagingController.itemList.map((e) {
          //     if (e.category.id == productId) {
          //       print("product cart count --->" + e.count.toString());
          //       if ((e.count) > 1) {
          //         e.count--;
          //       } else if (e.count == 1) {
          //         setRefresh = true;
          //       }
          //     }
          //     return e;
          //   }).toList();
          // });

          if (setRefresh) _pagingController.refresh();
        },
        onError: (message) {
          dismissLoading();
          _pagingController.refresh();
          // showError(message);
        },
        productID: productId);
  }

  void removeProductFromCart(productId) {
    _cartModel.removeProductFromCart(
        onSuccess: (response) {
          dismissLoading();
          _pagingController.refresh();
        },
        onError: (message) {
          dismissLoading();
          _pagingController.refresh();
          // showError(message);
        },
        serviceId: productId);
  }

  void removeCategoryFromCart(category) {
    print("removeCategoryFromCart --->" + category.id.toString());
    _cartModel.removeCategoryFromCart(
        onSuccess: (response) {
          dismissLoading();
          _pagingController.refresh();
        },
        onError: (message) {
          dismissLoading();
          _pagingController.refresh();
          // showError(message);
        },
        serviceId: category.id);
  }

  void removeCategoryFromCartDialog(category) {
    showDialog(
        context: context,
        builder: (BuildContext context) => getDeleteConfirmDialogView(
            context, category, removeCategoryFromCart));
  }

  void onAddNEwCategory(FixJedCategory category) {
    print("onAddNEwCategory --->" + category.toString());

    Navigator.of(context)
        .pushNamed(Routes.SUB_SERVICE_FEATURES, arguments: category);
    // FixJedCategory fixJedCategory = FixJedCategory();
  }
}
