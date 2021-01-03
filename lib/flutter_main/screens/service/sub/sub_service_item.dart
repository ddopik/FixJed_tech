import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class SubServiceItem extends StatefulWidget {
  final Product product;
  final Function onAdd, onRemove;

  SubServiceItem({this.product, this.onAdd, this.onRemove});

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
        "TotalAddedServicesState ---> build() with ${widget.product.totalCartCount}");
// return Container(width: 200,height: 200,color: Colors.white70,);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 2.0,
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .20,
          padding: EdgeInsets.all(18.0),
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
                    widget.product.name??'',
                    style: TextStyle(
                        color: boring_green,
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
                      widget.product.description ?? "",
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
                      Text(widget.product.price.toString() +" "+S.of(context).egp,
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
                                    widget.onAdd(widget.product.id,
                                        widget.product.totalCartCount);
                                  },
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              widget.product.totalCartCount.toString(),
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
                                    widget.onRemove(widget.product.id,
                                        widget.product.totalCartCount);
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
