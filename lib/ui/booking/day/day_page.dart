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
    var selected = context.read<DayModel>().selected;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.calendarTitle),
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
          onViewChanged: (details) {
            selected = details.visibleDates.first;
            print(selected);
          },
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
    );
  }
}
