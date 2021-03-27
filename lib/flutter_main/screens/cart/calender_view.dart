import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;

class CalenderView extends StatefulWidget {
  final Function(DateTime date) onDateSelected;

  const CalenderView({this.onDateSelected});

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentSelectedDate = date);
        widget.onDateSelected(_currentSelectedDate);
      },
      // dayButtonColor: Colors.amber,
      // markedDateIconBorderColor: Colors.blue,
      todayButtonColor: Colors.transparent,
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      showWeekDays: false,
      firstDayOfWeek: 5,
//       markedDatesMap: _markedDateMap,
      height: 210,
      selectedDateTime: _currentSelectedDate,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      showHeader: false,

      todayTextStyle: TextStyle(
        color: french_blue,
      ),
      minSelectedDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      maxSelectedDate: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .add(Duration(days: 360)),

      selectedDayTextStyle: TextStyle(
        color: french_blue,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
      ),

      daysTextStyle: TextStyle(
        color: french_blue,
        fontSize: 16,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),

      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
      ),
      nextDaysTextStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
      ),
      weekendTextStyle: TextStyle(
        color: french_blue,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: "Futura",
        fontStyle: FontStyle.normal,
      ),

      selectedDayButtonColor: Color(0x8b61ba66),
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
          Padding(
            padding: EdgeInsets.only(top: 14),
            child: Text(S.current.chooseCheckDate,
                style: const TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: 18),
                textAlign: TextAlign.center),
          ),
          Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: boring_green, size: 15),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month + 1);
                    });
                  },
                ),
                Text(
                  DateFormat.MMM().format(_targetDateTime),
                  style: TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                ),
                FlatButton(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: boring_green,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month - 1);
                    });
                  },
                )
              ],
            ),
          ),
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
