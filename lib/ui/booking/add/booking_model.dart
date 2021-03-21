import 'package:flutter/material.dart';

import '../../../model/calendar/schedule.dart';

class BookingModel extends ChangeNotifier {
  int index;

  BookingModel(this.index);

  List<Schedule> holidays = <Schedule>[];
}
