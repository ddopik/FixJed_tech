import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/product_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/service.dart';
import 'service_feature_item_view.dart';

// ignore: must_be_immutable
class MainServicesListView extends StatefulWidget {
  final FixJidCategory fixJidCategory;

  MainServicesListView({this.fixJidCategory});

  @override
  _PagedServiceListViewState createState() => _PagedServiceListViewState();
}

class _PagedServiceListViewState extends State<MainServicesListView> {
  final _pagingController = PagingController<int, FixJidService>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("MainServicesListView ---> initState ServiceCategory is " +
        widget.fixJidCategory.id.toString());
    _fetchPage(0);
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    ProductModel().getCategoryServiceList(
        onSuccess: (service) {
          print("MainServicesListView  (_fetchPage" +
              widget.fixJidCategory.id.toString() +
              ")---> returned Services size is  " +
              (service as List).length.toString());
          _pagingController.appendLastPage(service);
          // _pagingController.appendPage(service, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
          _pagingController.appendLastPage([]);
        },
        categoryId: widget.fixJidCategory.id,
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
    // print("MainFeaturesListView ---> build() " + widget.category.name.toString() + "   " + widget.category.id.toString());
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: Stack(
        children: <Widget>[
          ListView(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .15,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 28,
                        ),
                        Container(
                          child: CustomImageLoader.image(
                              url: widget.fixJidCategory.imageUrl,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * .25,
                              height: MediaQuery.of(context).size.height * .3),
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 24,
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
                              widget.fixJidCategory.name,
                              style: TextStyle(
                                  color: boring_green,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "description here",
                              style: TextStyle(
                                  color: Color(0xd9275597),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height * .69,
                      child: renderServiceList()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  renderServiceList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FixJidService>(
        itemBuilder: (context, service, index) {
          print("renderServiceList ---> $index");
          return GestureDetector(
            child: ServiceFeatureItemView(service: service),
            onTap: () {
              print(
                  "ServiceFeatureItemView OnTap ---> " + service.id.toString());
              if (service.hasProduct) {
                Navigator.of(context)
                    .pushNamed(Routes.SUB_SERVICE_FEATURES, arguments: service);
              }
            },
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