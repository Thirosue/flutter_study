import 'package:flutter/material.dart';

import '../../model/calendar/schedule.dart';

class HolidayModel extends ChangeNotifier {
  int index;

  HolidayModel(this.index);

  List<Schedule> holidays = <Schedule>[];
  int now = 1;

  void add() {
    var today = DateTime.now();
    var startTime = today.add(
      Duration(days: now++),
    );
    var endTime = startTime.add(
      const Duration(hours: 2),
    );
    holidays.add(Schedule(
      from: startTime,
      to: endTime,
      subject: 'Holiday',
    ));
    notifyListeners();
  }
}
