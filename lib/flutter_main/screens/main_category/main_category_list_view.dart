import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/provider/main_category_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'main_category_item.dart';

class MainCategoryListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCategoryListViewState();
  }
}

class MainCategoryListViewState extends State<MainCategoryListView> {
  final _pagingController = PagingController<int, FixJidCategory>(
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

    // final newItems =
    //     await widget.repository.getArticleListPage(number: pageKey, size: 8);
    //
    // /// todo get object contain list of items and if it is last page;
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
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedGridView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FixJidCategory>(
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
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: .7,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
        ),
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: GridView.count(
//           crossAxisCount: 3,
//           childAspectRatio: .7,
//           padding: const EdgeInsets.all(4.0),
//           mainAxisSpacing: 0.0,
//           crossAxisSpacing: 0.0,
//           children: [
//             ...MainCategoryModel().menuList.map((e) {
//               return InkWell(
//                 child: HomeCategoryItem(e),
//                 onTap: () {
//                   print("HomeCategoryItem OnTap ---> " +
//                       e.serviceId.toString());
//                   Navigator.of(context)
//                       .pushNamed(Routes.SERVICE_FEATURES, arguments: e);
//                 },
//               );
//             })
//           ]));
// }
}
