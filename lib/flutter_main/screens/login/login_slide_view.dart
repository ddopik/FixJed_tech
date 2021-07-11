import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSlideView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginSlideViewState();
  }
}

class _LoginSlideViewState extends State<LoginSlideView> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/tec_img.png',
    'assets/images/tec_img_3.png',
    'assets/images/tec_img_2.png',
  ];

  final List<String> titleList = [
    'The app that fits all the technicians',
    'The Support that every technician is Dreaming of ',
    'Your time worth lots of money',
  ];
  final List<String> descList = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida elit morbi id arcu aliquet ',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida elit morbi id arcu aliquet ',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Gravida elit morbi id arcu aliquet ',
  ];
  List<Widget> imageSliders;

  @override
  void initState() {
    imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.contain, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              viewportFraction: .9,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        getDescView(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .020,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 0 ? Colors.black : Colors.white),
              ),
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 1 ? Colors.black : Colors.white),
              ),
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == 2 ? Colors.black : Colors.white),
              )
            ],
          ),
        ),
      ]),
    );
  }

  getDescView() {
    return Container(
      width: MediaQuery.of(context).size.width * .60,
      child: Column(
        children: [
          AutoSizeText(titleList[_current],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline3.copyWith()),
          SizedBox(
            height: 4,
          ),
          AutoSizeText(descList[_current],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
