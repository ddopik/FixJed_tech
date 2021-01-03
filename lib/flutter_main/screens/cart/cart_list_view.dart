import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/cart/model/cart_response.dart';
import 'package:flutter_base_app/flutter_main/screens/cart/provider/cart_model.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/product_model.dart';
import 'package:flutter_base_app/flutter_main/screens/service/sub/sub_service_item.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// ignore: must_be_immutable
class CartListView extends StatefulWidget {
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  double getQuantityActionViewHeight = 0;
  double getQuantityActionViewWidth = 0;
  int totalAddedServices = 0;
  final _pagingController = PagingController<int, CartResponse>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _fetchPage(0);
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    CartModel().getCartProduct(
        onSuccess: (features) {
          _pagingController.appendLastPage(features);
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: renderCartList()),
                ],
              ),
            ),
          ),
          getQuantityActionView(),
        ],
      ),
    );
  }

  viewQuantityActionView(int count) {
    setState(() {
      totalAddedServices = count;
      getQuantityActionViewWidth = MediaQuery.of(context).size.width;
      getQuantityActionViewHeight = 50;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        getQuantityActionViewWidth = 0;
        getQuantityActionViewHeight = 0;
      });
    });
  }

  Widget getQuantityActionView() {
    var firstSegment = S.of(context).youHaveAdded;
    var midSegment = totalAddedServices.toString();
    var lastSegment = S.of(context).cartService;
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      width: getQuantityActionViewWidth,
      height: getQuantityActionViewHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0))),
      child: Container(
        child: Text(
          firstSegment + " " + midSegment + " " + lastSegment,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  renderCartList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CartResponse>(
        itemBuilder: (context, cartProduct, index) {
          print("PagedCartListView builder called is --->" + cartProduct.product.totalCartCount.toString());
          return SubServiceItem(
              product: cartProduct.product,
              onAdd: (subServiceId, count) {
                setState(() {
                  _pagingController.itemList =
                      _pagingController.itemList.map((e) {
                    // print("map is --->"+e.serviceId +" currentSelected ---->"+subServiceId);
                    if (e.id == subServiceId) {
                      print("found Match Add service");
                      totalAddedServices = totalAddedServices + 1;
                      e.product.totalCartCount = e.product.totalCartCount + 1;
                      viewQuantityActionView(totalAddedServices);
                    }
                    return e;
                  }).toList();
                });
              },
              onRemove: (subServiceId, count) {
                setState(() {
                  _pagingController.itemList =
                      _pagingController.itemList.map((e) {
                    // print("map is --->"+e.serviceId +" currentSelected ---->"+subServiceId);
                    if (e.id == subServiceId) {
                      if ((e.product.totalCartCount) > 0) {
                        e.product.totalCartCount = e.product.totalCartCount - 1;
                        totalAddedServices = totalAddedServices - 1;
                        viewQuantityActionView(totalAddedServices);
                      }
                    }
                    return e;
                  }).toList();
                  ;
                });
              });
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

  getGroupedCardView(){
    return Container(
        alignment: Alignment.topCenter,
        child: Wrap(
          verticalDirection: VerticalDirection.down,
          direction: Axis.vertical,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ],
                      color: french_blue),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CustomImageLoader.image(
                                url: "", width: 40, height: 40),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: boring_green,
                              ),
                              onPressed: () {})
                        ],
                      ),
                      Container(
                          width: 112.66666666666667,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              color: french_blue)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 112.66666666666667,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              color: french_blue)),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        child: Row(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 22,
                                height: 22,
                                color: Colors.green,
                                alignment: Alignment.topCenter,
                                child: FittedBox(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    iconSize: 144,
                                    onPressed: () {
                                      // widget.onAdd(widget.service.id,
                                      //     widget.service.totalCartCount);
                                    },
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),

                            // اضف خدمة اخري
                            Text("اضف خدمة اخري ",
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Tajawal",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.7),
                                textAlign: TextAlign.left)
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      // اجمالي
                      Container(
                        margin: EdgeInsets.all( 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("اجمالي",
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Tajawal",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                            // ٢٥٠ جنيه مصري
                            Text("٢٥٠ جنيه مصري",
                              style: const TextStyle(
                                  color: boring_green,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
