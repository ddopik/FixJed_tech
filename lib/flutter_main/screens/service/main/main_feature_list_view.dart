import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/screens/home/model/FixJidCategory.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/feature_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/feature.dart';
import 'feature_list_item.dart';

// ignore: must_be_immutable
class MainFeaturesListView extends StatefulWidget {
  final FixJidCategory category;

  MainFeaturesListView({this.category});

  @override
  _PagedFeaturesListViewState createState() => _PagedFeaturesListViewState();
}

class _PagedFeaturesListViewState extends State<MainFeaturesListView> {
  final _pagingController = PagingController<int, Feature>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("MainFeaturesListView ---> initState category is " +
        widget.category.id.toString());
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    FeaturesModel().getCategoryFeaturesList(
        onSuccess: (features) {
          print("MainFeaturesListView  (_fetchPage" +
              widget.category.id.toString() +
              ")---> returned features size is  " +
              (features as List).length.toString());
          _pagingController.appendPage(features, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
        },
        categoryId: widget.category.id,
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
            color: Colors.red,
            child: Container(
              padding: EdgeInsets.all(14.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 120,
                    child: Row(
                      children: [
                        Image.asset(
                          widget.category.imgPath,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 14.0,
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
                              widget.category.name,
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
                              widget.category.desc,
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
                  renderFeaturesList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  renderFeaturesList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Feature>(
        itemBuilder: (context, features, index) {
          return FeatureListItemView(features: features);
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
