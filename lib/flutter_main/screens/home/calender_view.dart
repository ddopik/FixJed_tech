import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

class CalenderView extends StatefulWidget {
  final Function(DateTime date) onDateSelected;

  CalenderView({this.onDateSelected});

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<CalenderView> {
  // DateTime _currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _currentSelectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime _targetDateTime =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  CalendarCarousel _calendarCarouselNoHeader;
  EventList<Event> events = EventList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("allEventRequest ---> " +
        Provider.of<TransactionModel>(context)
            .allEventRequest
            .events
            .toString());
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        // this.setState(() => _currentSelectedDate = date);
        // widget.onDateSelected(_currentSelectedDate);
        var eventM = events.firstWhere((element) {
          if (element.date == date) {
            return true;
          }
          return false;
        }, orElse: () {
          return null;
        });

        if (eventM != null) {
          print("Found one");
          Navigator.of(context).pushNamed(Routes.ALL_REQUESTS);
        }
      },
      // dayButtonColor: boring_green,
      // markedDateIconBorderColor: Colors.blue,
      todayButtonColor: Colors.transparent,
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      showWeekDays: true,
      firstDayOfWeek: 5,
      markedDatesMap: Provider.of<TransactionModel>(context).allEventRequest,
      height: MediaQuery.of(context).size.height * .34,
      selectedDateTime: _currentSelectedDate,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      showHeader: false,

      todayTextStyle: TextStyle(
        color: french_blue,
      ),
      // minSelectedDate: DateTime(
      //     DateTime.now().year, DateTime.now().month, DateTime.now().day ),
      // maxSelectedDate: DateTime(
      //         DateTime.now().year, DateTime.now().month, DateTime.now().day)
      //     .add(Duration(days: 360)),
      markedDateIconBorderColor: boring_green,
      selectedDayTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.white,
          ),
      markedDateWidget: ClipOval(
        child: Container(
          width: 5,
          height: 5,
          color: boring_green,
        ),
      ),

      daysTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Color(0xff000000),
          ),

      prevDaysTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.grey,
          ),
      inactiveDaysTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.grey,
          ),
      nextDaysTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.grey,
          ),
      weekendTextStyle: Theme.of(context).textTheme.bodyText1.copyWith(
            color: french_blue,
          ),
      weekdayTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xff000000),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      selectedDayButtonColor: Color(0xff61ba66),
      selectedDayBorderColor: Colors.transparent,

      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(_currentSelectedDate.day.toString(),
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Color(0xff61ba66),
                            fontSize: 36,
                          ),
                      textAlign: TextAlign.center),
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        padding: EdgeInsets.all(0),
                        child: Icon(Icons.arrow_back_ios,
                            color: boring_green, size: 15),
                        onPressed: () {
                          setState(() {
                            _targetDateTime = DateTime(_targetDateTime.year,
                                _targetDateTime.month + 1);
                          });
                        },
                      ),
                      Text(
                        DateFormat.MMM().format(_targetDateTime) +
                            " " +
                            _targetDateTime.year.toString(),
                        style: TextStyle(
                          color: french_blue,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Tajawal",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                      Container(
                          child: MaterialButton(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: boring_green,
                          size: 15,
                        ),
                        onPressed: () {
                          setState(() {
                            _targetDateTime = DateTime(_targetDateTime.year,
                                _targetDateTime.month - 1);
                          });
                        },
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22.0),
            child: _calendarCarouselNoHeader,
          ),
          //
        ],
      ),
    );
  }
}
