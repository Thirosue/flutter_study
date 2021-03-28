import 'package:flutter/material.dart';

import '../../model/calendar/schedule.dart';

class CalendarModel extends ChangeNotifier {
  int index;
  List<Schedule> bookings;
  DateTime selected = DateTime.now();

  CalendarModel(this.index, this.bookings);

  static DateTime roundAtStartTime(DateTime target) => DateTime(
        target.year,
        target.month,
        target.day,
        10,
        0,
      );

  static DateTime roundAtEndTime(DateTime target) => DateTime(
        target.year,
        target.month,
        target.day,
        20,
        0,
      );
}
