import 'package:flutter/material.dart';

import '../../model/calendar/schedule.dart';

class CalendarModel extends ChangeNotifier {
  int index;
  List<Schedule> bookings;
  DateTime selected = DateTime.now();

  CalendarModel(this.index, this.bookings);
}
