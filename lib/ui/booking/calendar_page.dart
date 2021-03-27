import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constants.dart';
import '../../model/calendar/schedule.dart';
import '../../model/calendar/schedule_data_source.dart';
import '../../repository/calendar_repository.dart';
import '../component/templates/template.dart';
import 'calendar_model.dart';
import 'day/day_page.dart';
import 'register/booking_page.dart';

class CalendarPage extends StatelessWidget {
  final CalendarRepository repository;

  const CalendarPage({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = Constants.calendarIndex;

    return FutureProvider<CalendarModel>(
      create: (context) async {
        var bookings = await repository.current();
        return CalendarModel(
          index,
          bookings,
        );
      },
      initialData: CalendarModel(
        index,
        <Schedule>[],
      ),
      child: CalendarApp(),
    );
  }
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booking = context.watch<CalendarModel>().bookings;
    var selected = context.read<CalendarModel>().selected;

    return Template(
      index: context.watch<CalendarModel>().index,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Scaffold(
          body: Container(
            child: SfCalendar(
              view: CalendarView.month,
              todayHighlightColor: Colors.red,
              showNavigationArrow: true,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
              ),
              dataSource: ScheduleDataSource(
                booking,
              ),
              onTap: (details) {
                selected = details.date;
              },
              onLongPress: (details) {
                Get.to(
                  () => DayPage(),
                  arguments: [
                    details.date,
                    booking,
                  ],
                  fullscreenDialog: true,
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final day =
                  DateTime.now().isBefore(selected) ? selected : DateTime.now();
              Get.to(
                () => BookingPage(),
                arguments: day,
                fullscreenDialog: true,
              );
            },
            tooltip: 'Booking',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
