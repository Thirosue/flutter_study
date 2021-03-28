import 'package:flutter/material.dart';

import '../../../model/calendar/schedule.dart';

class DayModel extends ChangeNotifier {
  List<Schedule> bookings;
  DateTime selected = DateTime.now();

  DayModel(this.bookings);
}
