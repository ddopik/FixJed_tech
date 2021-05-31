import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/view/RequestsListView.dart';

import 'calender_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome, abdo"),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.repeat_one_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(22),
              child: Column(
                children: [
                  getCalenderView(),
                  Container(
                    height: MediaQuery.of(context).size.height * .38,
                    color: Colors.amber,
                    child: GestureDetector(
                      child: RequestsListView(),
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.ALL_REQUESTS);
                      },
                    ),
                  ),
                ],
              )),
        ));
  }

  Widget getCalenderView() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 6, left: 6, right: 6),
          child: Card(
              color: Colors.white.withOpacity(0.800000011920929),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 2.0,
              child: Container(
                child: CalenderView(),
              )),
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              child: CalenderView(
                onDateSelected: (DateTime date) {
                  print("Current Selected Date is " + date.toString());
                },
              ),
            ))
      ],
    );
  }
}
