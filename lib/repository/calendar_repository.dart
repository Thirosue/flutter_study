import 'dart:math';

import '../model/calendar/schedule.dart';

class CalendarRepository {
  Future<List<Schedule>> current() async {
    final random = Random();
    final now = DateTime.now();
    final days = List.generate(
      40,
      (_) => DateTime(
        now.year,
        now.month,
        random.nextInt(28) + 1, // day
        [10, 11, 12, 13, 14, 15][random.nextInt(6)], // start time
      ),
    );

    final schedule = days.map((day) => Schedule(
          from: day,
          to: day.add(
            Duration(hours: [1, 2][random.nextInt(2)]),
          ),
          subject: 'Booking',
        ));

    return Future.value(schedule.toList());
  }
}
