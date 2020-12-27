import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/empty_list_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
 import 'package:flutter_base_app/flutter_main/screens/service/provider/feature_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/service.dart';
import 'service_feature_item_view.dart';

// ignore: must_be_immutable
class MainServicesListView extends StatefulWidget {
  final FixJidService service;

  MainServicesListView({this.service});

  @override
  _PagedServiceListViewState createState() => _PagedServiceListViewState();
}

class _PagedServiceListViewState extends State<MainServicesListView> {
  final _pagingController = PagingController<int, FixJidService>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    print("MainServicesListView ---> initState Service is " +
        widget.service.serviceId.toString());
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
    FeaturesModel().getServiceFeaturesList(
        onSuccess: (service) {
          print("MainServicesListView  (_fetchPage" +
              widget.service.serviceId.toString() +
              ")---> returned Service size is  " +
              (service as List).length.toString());
          _pagingController.appendPage(service, nextPageKey);
        },
        onError: (error) {
          _pagingController.error = error;
        },
        serviceId: widget.service.serviceId,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          widget.service.serviceImage,
                          fit: BoxFit.contain,
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
                              widget.service.serviceName,
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
                              widget.service.serviceDesc,
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
              print("ServiceFeatureItemView OnTap ---> "+service.serviceId.toString());

              Navigator.of(context)
                  .pushNamed(Routes.SUB_SERVICE_FEATURES, arguments: service);
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
