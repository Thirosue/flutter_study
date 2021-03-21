import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants.dart';
import '../../../model/calendar/schedule_data_source.dart';
import '../../../ui/component/template.dart';
import 'day_model.dart';

class DayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Constants.calendarIndex;
    final booking = Get.arguments;

    return ChangeNotifierProvider(
      create: (context) => DayModel(
        index,
        booking,
      ),
      child: DayApp(),
    );
  }
}

class DayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booking = context.watch<DayModel>().bookings;

    return Template(
      index: context.watch<DayModel>().index,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Scaffold(
          body: Container(
            child: SfCalendar(
              view: CalendarView.day,
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
      ),
    );
  }
}
