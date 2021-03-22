import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants.dart';
import '../../../model/calendar/schedule_data_source.dart';
import 'day_model.dart';

class DayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Constants.calendarIndex;
    final List arguments = Get.arguments;
    final DateTime selectDate = arguments.first;
    final initialDisplayDate = DateTime(
      selectDate.year,
      selectDate.month,
      selectDate.day,
      9,
      0,
    );

    return ChangeNotifierProvider(
      create: (context) => DayModel(
        index,
        arguments.last,
      ),
      child: DayApp(
        initialDisplayDate: initialDisplayDate,
      ),
    );
  }
}

class DayApp extends StatelessWidget {
  final DateTime initialDisplayDate;

  const DayApp({Key? key, required this.initialDisplayDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booking = context.watch<DayModel>().bookings;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booking'),
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.day,
            initialDisplayDate: initialDisplayDate,
            todayHighlightColor: Colors.red,
            showNavigationArrow: true,
            monthViewSettings: const MonthViewSettings(
              showAgenda: true,
            ),
            dataSource: ScheduleDataSource(
              booking,
            ),
            onTap: (details) {
              print(details.date);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Booking',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
