import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class SubServiceItem extends StatefulWidget {
  final Product product;
  final Function onAdd, onSubtract;

  SubServiceItem({this.product, this.onAdd, this.onSubtract});

  @override
  State<StatefulWidget> createState() {
    print("SubServiceItem ---> build with ${product.id}");
    return TotalAddedServicesState();
  }
}

class TotalAddedServicesState extends State<SubServiceItem> {
  @override
  Widget build(BuildContext context) {
    print(
        "TotalAddedServicesState ---> build() with ${widget.product.productCartCount}");
// return Container(width: 200,height: 200,color: Colors.white70,);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 2.0,
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .17,
          padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 26, right: 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name ?? '',
                    style: TextStyle(
                        color: french_blue,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Tajawal",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: MediaQuery.of(context).size.height * .07,
                    child: Text(
                      widget.product.description ??
                          "description description description description description description description description",
                      style: TextStyle(
                          color: Color(0xff646363),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Tajawal",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                          widget.product.price.toString() +
                              " " +
                              S.of(context).egp,
                          style: const TextStyle(
                              color: boring_green,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Futura",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 28,
                              height: 28,
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
                                    widget.onAdd(widget.product.id,
                                        widget.product.productCartCount);
                                  },
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              widget.product.productCartCount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: french_blue),
                            ),
                          ),
                          ClipOval(
                            child: Container(
                              width: 28,
                              height: 28,
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
                                    widget.onSubtract(widget.product.id,
                                        widget.product.productCartCount);
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
