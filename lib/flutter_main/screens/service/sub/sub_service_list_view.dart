import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/product_model.dart';
import 'package:flutter_base_app/flutter_main/screens/service/sub/sub_service_item.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/service.dart';

// ignore: must_be_immutable
class SubFeaturesListView extends StatefulWidget {
  final FixJidService service;

  SubFeaturesListView({this.service});

  @override
  _PagedSubFeaturesListViewState createState() =>
      _PagedSubFeaturesListViewState();
}

class _PagedSubFeaturesListViewState extends State<SubFeaturesListView> {
  double getQuantityActionViewHeight = 0;

  ViewActionModel viewActionModel = ViewActionModel();

  ProductModel _productModel;
  final _pagingController = PagingController<int, Product>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("MainFeaturesListView ---> initState category is " +
        widget.service.id.toString());
    _productModel = ProductModel();
    _fetchPage(0);
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    ProductModel().getServicesProducts(
        onSuccess: (features) {
          print("MainFeaturesListView  (_fetchPage" +
              widget.service.id.toString() +
              ")---> returned features size is  " +
              (features as List).length.toString());

          Product product = (features as List)[0];
          if (product.isDefault) {
            setState(() {
              viewActionModel.requestExamineEnabled = true;
              viewActionModel.requestExamineObject = product;
            });
          }

          _pagingController.appendLastPage(features);
          // _pagingController.appendPage(features, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
        },
        serviceId: widget.service.id,
        page: nextPageKey);

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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("SubFeaturesListView ---> build()  called");
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    child: getSubFeatureHeaderView(),
                  ),
                  Expanded(child: renderFeaturesList()),
                ],
              ),
            ),
          ),
          getQuantityActionView(),
        ],
      ),
    );
  }

  viewQuantityActionView() {
    setState(() {
      viewActionModel.totalAddedServices = viewActionModel.totalAddedServices;
      getQuantityActionViewHeight = 50;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        getQuantityActionViewHeight = 0;
      });
    });
  }

  Widget getQuantityActionView() {
    var firstSegment = S.of(context).youHaveAdded;
    var midSegment = viewActionModel.totalAddedServices.toString();
    var lastSegment = S.of(context).cartService;

    if (viewActionModel.actionType == ActionType.CART_PRODUCT) {
      viewActionModel.viewActionMessage =
          firstSegment + " " + midSegment + " " + lastSegment;
    }
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      width: MediaQuery.of(context).size.width,
      height: getQuantityActionViewHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0))),
      child: Container(
        child: Text(
          viewActionModel.viewActionMessage,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget getSubFeatureHeaderView() {
    var x = "تريد مساعدة ؟ اطلب خبير ";
    var y = " 50 جنيه مصري";
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 12.0,
            ),
            CustomImageLoader.image(
                url: widget.service.imageUrl ?? '',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * .35,
                height: MediaQuery.of(context).size.height * .12),
            SizedBox(
              width: 12.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  widget.service.name,
                  style: TextStyle(
                      color: boring_green,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Tajawal",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    widget.service.description ?? "",
                    maxLines: 3,
                    style: TextStyle(
                        color: Color(0xd9275597),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Tajawal",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                  ),
                ),
              ],
            )
          ],
        ),
        viewActionModel.requestExamineEnabled
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .1,
                color: Color(0xd9275597),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$x \n $y",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                    customActionButton(
                        width: MediaQuery.of(context).size.width * .35,
                        height: 43,
                        btnText: "اطلب خبير",
                        btnColor: boring_green,
                        textColor: white,
                        onPressed: () {
                          showLoading(context);
                          _productModel.addProductToCart(
                              onSuccess: (response) {
                                dismissLoading();
                                setState(() {
                                  print("SetState() called");
                                  viewActionModel.actionType =
                                      ActionType.MESSAGE;
                                  viewActionModel.viewActionMessage =
                                      "تم آضافه طلب خبير";
                                  viewQuantityActionView();
                                });
                              },
                              onError: (message) {
                                dismissLoading();
                                showError(message);
                              },
                              productID:
                                  viewActionModel.requestExamineObject.id);
                        }),
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  renderFeaturesList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, service, index) {
          print("PagedListView builder called is --->" +
              service.totalCartCount.toString());
          return SubServiceItem(
              product: service,
              onAdd: (productId, count) {
                showLoading(context);
                _productModel.addProductToCart(
                    onSuccess: (response) {
                      dismissLoading();

                      _pagingController.itemList =
                          _pagingController.itemList.map((e) {
                        print("map is --->" + e.id.toString());
                        if (e.id == productId) {
                          print("Found Match --->" + productId.toString());
                          viewActionModel.totalAddedServices = viewActionModel.totalAddedServices + 1;
                          e.totalCartCount = e.totalCartCount + 1;

                        }
                        return e;
                      }).toList();
                      setState(() {
                        print("SetState() called");
                        viewActionModel.actionType = ActionType.CART_PRODUCT;
                        viewQuantityActionView();
                      });
                    },
                    onError: (message) {
                      dismissLoading();
                      showError(message);
                    },
                    productID: productId);
              },
              onRemove: (productId, count) {
                showLoading(context);
                _productModel.removeProductFromCart(
                    onSuccess: (response) {
                      dismissLoading();

                      setState(() {
                        _pagingController.itemList =
                            _pagingController.itemList.map((e) {
                          // print("map is --->"+e.serviceId +" currentSelected ---->"+subServiceId);
                          if (e.id == productId) {
                            if ((e.totalCartCount) > 0) {
                              e.totalCartCount = e.totalCartCount - 1;
                              viewActionModel.totalAddedServices = viewActionModel.totalAddedServices - 1;
                              // viewQuantityActionView(totalAddedServices,"remove");
                            }
                          }
                          return e;
                        }).toList();
                        ;
                      });
                    },
                    onError: (message) {
                      dismissLoading();
                      showError(message);
                    },
                    productID: productId);
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
}

class ViewActionModel {
  bool requestExamineEnabled = false;
  ActionType actionType;
  String viewActionMessage='';
  Product requestExamineObject;
  int totalAddedServices = 0;
}

enum ActionType { CART_PRODUCT, MESSAGE }
