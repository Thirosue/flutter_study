import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../model/calendar/schedule_data_source.dart';
import '../../ui/component/template.dart';
import 'calendar_model.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Get.parameters['index'];

    return ChangeNotifierProvider(
      create: (context) => CalendarModel(index != null ? int.parse(index) : 0),
      child: CalendarApp(),
    );
  }
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                context.watch<CalendarModel>().holidays,
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
