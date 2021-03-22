import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/provider/main_category_model.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'main_category_item.dart';

class MainCategoryListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCategoryListViewState();
  }
}

class MainCategoryListViewState extends State<MainCategoryListView> {
  final _pagingController = PagingController<int, FixJedCategory>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    print("BrandListView ---->_fetchPage() ---> $nextPageKey ");

    MainCategoryModel().getMainCategory(
      page: nextPageKey,
      onSuccess: (categories) {
        print("MainCategoryListView ---->_fetchPage() --->  " +
            categories.toString());
        _pagingController.appendLastPage(categories);
      },
      onError: (error) {
        _pagingController.error = error;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(inner_boundary_field_space),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.services,
                  style: const TextStyle(
                      color: boring_green,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Tajawal",
                      fontStyle: FontStyle.normal,
                      fontSize: text_head_size_1),
                ),
                Text(
                  S.current.homeTitleDesc,
                  style: const TextStyle(
                      color: const Color(0xd9275597),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Tajawal",
                      fontStyle: FontStyle.normal,
                      fontSize: text_size_1),
                )
              ],
            ),
          ),
          Expanded(
              child: PagedGridView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<FixJedCategory>(
              itemBuilder: (context, fixJidCategory, index) {
                return InkWell(
                  child: HomeCategoryItem(fixJidCategory),
                  onTap: () {
                    print("HomeCategoryItem OnTap ---> " +
                        fixJidCategory.id.toString());
                    Navigator.of(context).pushNamed(Routes.SERVICE_FEATURES,
                        arguments: fixJidCategory);
                  },
                );
              },
              firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                error: _pagingController.error,
                onTryAgain: () => _pagingController.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .90,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
          ))
        ],
      ),
    );
  }
}
