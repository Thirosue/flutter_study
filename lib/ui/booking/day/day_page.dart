import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants.dart';
import '../../../model/calendar/schedule_data_source.dart';
import '../calendar_model.dart';
import '../register/booking_page.dart';
import 'day_model.dart';

class DayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List arguments = Get.arguments;
    final DateTime selectDate = arguments.first;

    return ChangeNotifierProvider(
      create: (context) => DayModel(
        arguments.last,
      ),
      child: DayApp(
        initialDisplayDate: DateTime(
          selectDate.year,
          selectDate.month,
          selectDate.day,
          9,
          0,
        ),
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
          dataSource: ScheduleDataSource(
            booking,
          ),
          onViewChanged: (details) =>
              context.read<DayModel>().selected = details.visibleDates.first,
          onLongPress: (details) {
            var selected = details.date!;
            if (selected.hour < 10) {
              selected = CalendarModel.roundAtStartTime(selected);
            } else if (20 < selected.hour) {
              selected = CalendarModel.roundAtEndTime(selected);
            }
            Get.to(
              () => BookingPage(),
              arguments: selected,
              fullscreenDialog: true,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selected = context.read<DayModel>().selected;
          final now = DateTime.now();
          final day = now.isBefore(selected)
              ? CalendarModel.roundAtStartTime(selected)
              : CalendarModel.roundAtStartTime(now);
          Get.to(
            () => BookingPage(),
            arguments: day,
            fullscreenDialog: true,
          );
        },
        tooltip: 'Booking',
        child: const Icon(Icons.add),
      ),
    );
  }
}
