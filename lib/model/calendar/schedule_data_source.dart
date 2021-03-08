import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'schedule.dart';

class ScheduleDataSource extends CalendarDataSource {
  ScheduleDataSource(List<Schedule> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments[index].from;

  @override
  DateTime getEndTime(int index) => appointments[index].to;

  @override
  String getSubject(int index) => appointments[index].subject;

  @override
  Color getColor(int index) => appointments[index].background;

  @protected
  bool isAllDay(int index) => appointments[index].isAllDay;
}
