import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class CarItemView extends StatefulWidget {
  final FixJedCategory category;
  final Function onAddQuantity,
      onRemoveQuantity,
      onRemoveProduct,
      onRemoveCategory;

  CarItemView(
      {this.category,
      this.onAddQuantity,
      this.onRemoveQuantity,
      this.onRemoveProduct,
      this.onRemoveCategory});

  @override
  State<StatefulWidget> createState() {
    print("SubServiceItem ---> build with ${category.toString()}");
    return TotalAddedServicesState();
  }
}

class TotalAddedServicesState extends State<CarItemView> {
  @override
  Widget build(BuildContext context) {
    return getGroupedCardView();
  }

  getGroupedCardView() {
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
                  width: MediaQuery.of(context).size.width * .9,
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: CustomImageLoader.image(
                                    url: widget.category.imageUrl,
                                    width: 50,
                                    height: 60),
                              ),
                              // غسالة
                              Text(
                                widget.category.name,
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Tajawal",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: boring_green,
                              ),
                              onPressed: () {
                                widget.onRemoveCategory(widget.category.id.toString());
                              })
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      for (Product product in widget.category.products)
                        getGroupedCardItemView(product),

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
                        margin: EdgeInsets.all(12),
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
                            Text(
                              getPrice(context,
                                  widget.category.totalPrice.toString()),
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

  Widget getGroupedCardItemView(Product product) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 2.0,
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .22,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name ?? '',
                        style: TextStyle(
                            color: french_blue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Tajawal",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: boring_green,
                          size: 16,
                        ),
                        onTap: () {
                          widget.onRemoveProduct(product.id);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .07,
                    child: Text(
                      widget.category.description ??
                          "description description description description description description description description",
                      style: TextStyle(
                          color: Color(0xff646363),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Tajawal",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(product.price.toString() + " " + S.of(context).egp,
                          style: const TextStyle(
                              color: boring_green,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Futura",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                      if (!product.isDefault)
                        Row(
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
                                      widget.onAddQuantity(product.id);
                                    },
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 14.0),
                              child: Text(
                                product.productCartCount.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: french_blue),
                              ),
                            ),
                            ClipOval(
                              child: Container(
                                width: 22,
                                height: 22,
                                color: Colors.green,
                                alignment: Alignment.topCenter,
                                child: FittedBox(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    iconSize: 144,
                                    onPressed: () {
                                      widget.onRemoveQuantity(product.id);
                                    },
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}