import 'package:flutter/material.dart';

import '../../model/calendar/schedule.dart';

class HolidayModel extends ChangeNotifier {
  List<Schedule> holidays = <Schedule>[];
  int index = 1;

  void add() {
    var today = DateTime.now();
    var startTime = today.add(
      Duration(days: index++),
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
