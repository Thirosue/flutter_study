import 'package:flutter/material.dart';

import '../../../model/calendar/schedule.dart';

class DayModel extends ChangeNotifier {
  int index;
  List<Schedule> bookings;
  DateTime selected = DateTime.now();

  DayModel(this.index, this.bookings);
}
