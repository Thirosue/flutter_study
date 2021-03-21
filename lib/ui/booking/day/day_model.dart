import 'package:flutter/material.dart';

import '../../../model/calendar/schedule.dart';

class DayModel extends ChangeNotifier {
  int index;
  List<Schedule> bookings;

  DayModel(this.index, this.bookings);
}
