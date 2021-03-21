import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../model/calendar/schedule_data_source.dart';
import '../../../ui/component/template.dart';
import 'booking_model.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Get.parameters['index'];

    return ChangeNotifierProvider(
      create: (context) => BookingModel(index != null ? int.parse(index) : 0),
      child: BookingApp(),
    );
  }
}

class BookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template(
      index: context.watch<BookingModel>().index,
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
                context.watch<BookingModel>().holidays,
              ),
              onTap: (details) {
                print(details.date);
              },
            ),
          ),
        ),
      ),
    );
  }
}
