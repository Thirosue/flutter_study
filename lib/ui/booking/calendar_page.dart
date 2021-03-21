import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constants.dart';
import '../../model/calendar/schedule.dart';
import '../../model/calendar/schedule_data_source.dart';
import '../../repository/calendar_repository.dart';
import '../../ui/component/template.dart';
import 'calendar_model.dart';

class CalendarPage extends StatelessWidget {
  final CalendarRepository repository = CalendarRepository();

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
                Get.toNamed(
                  Constants.day,
                  arguments: booking,
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Booking',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
