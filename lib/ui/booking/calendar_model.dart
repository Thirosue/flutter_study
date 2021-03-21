import 'package:flutter/material.dart';

import '../../model/calendar/schedule.dart';

class CalendarModel extends ChangeNotifier {
  int index;

  CalendarModel(this.index);

  List<Schedule> holidays = <Schedule>[];
}
