import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/product_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'service_feature_item_view.dart';

// ignore: must_be_immutable
class MainServicesListView extends StatefulWidget {
  final FixJedCategory fixJidCategory;

  MainServicesListView({this.fixJidCategory});

  @override
  _PagedServiceListViewState createState() => _PagedServiceListViewState();
}

class _PagedServiceListViewState extends State<MainServicesListView> {
  final _pagingController = PagingController<int, FixJedCategory>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("MainServicesListView ---> initState ServiceCategory is " +
        widget.fixJidCategory.id.toString());

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
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
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(inner_boundary_field_space),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .12,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: CustomImageLoader.image(
                            url: widget.fixJidCategory.imageUrl,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.height * .3),
                      ),
                      SizedBox(
                        width: form_field_space,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.fixJidCategory.name,
                            style: TextStyle(
                                color: boring_green,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Tajawal",
                                fontStyle: FontStyle.normal,
                                fontSize: text_head_size_1),
                          ),
                          SizedBox(
                            height: form_field_space_min,
                          ),
                          Text(
                            widget.fixJidCategory.description ??
                                "description here",
                            style: TextStyle(
                                color: Color(0xd9275597),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Tajawal",
                                fontStyle: FontStyle.normal,
                                fontSize: text_size_1),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: form_field_space),
                LimitedBox(
                    maxHeight: MediaQuery.of(context).size.height * .67,
                    child: renderServiceList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  renderServiceList() {
    return Container(
        child: PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FixJedCategory>(
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
      separatorBuilder: (context, index) => SizedBox(
        height: list_separator_space,
      ),
    ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
