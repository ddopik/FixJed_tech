import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/home/model/FixJidCategory.dart';
import 'package:flutter_base_app/flutter_main/screens/service/provider/feature_model.dart';
import 'package:flutter_base_app/flutter_main/screens/service/sub/sub_feature_listI_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/feature.dart';

// ignore: must_be_immutable
class SubFeaturesListView extends StatefulWidget {
  final FixJidCategory category;

  SubFeaturesListView({this.category});

  @override
  _PagedSubFeaturesListViewState createState() =>
      _PagedSubFeaturesListViewState();
}

class _PagedSubFeaturesListViewState extends State<SubFeaturesListView> {
  double getQuantityActionViewHeight = 0;
  double getQuantityActionViewWidth = 0;
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

  Widget getQuantityActionView() {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      height: getQuantityActionViewHeight,
      width: getQuantityActionViewWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0), topLeft: Radius.circular(16.0))),
      child: Container(
        child: Text(
          "you have added 1 item",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget getSubFeatureHeaderView() {
    var x ="تريد مساعدة ؟ اطلب خبير ";
    var y =" 50 جنيه مصري";
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(widget.category.imgPath,
                width: MediaQuery.of(context).size.width * .35,
                height: MediaQuery.of(context).size.height * .12),
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
        Container(
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
                  height: 42,
                  btnText: "اطلب خبير",
                  btnColor: boring_green,
                  textColor: white),

            ],
          ),
        )
      ],
    );
  }

  renderFeaturesList() {
    return PagedListView.separated(
      itemExtent: 300.0,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Feature>(
        itemBuilder: (context, features, index) {
          return SubFeatureListItem(features: features);
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
