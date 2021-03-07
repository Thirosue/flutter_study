import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Holiday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HolidayApp();
}

class _HolidayApp extends State<Holiday> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            todayHighlightColor: Colors.red,
            showNavigationArrow: true,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //何かする
            print('add click');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
