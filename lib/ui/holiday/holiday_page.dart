import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../constants.dart';
import '../../model/calendar/schedule_data_source.dart';
import '../component/templates/template.dart';
import 'holiday_model.dart';

class HolidayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Constants.holidayIndex;

    return ChangeNotifierProvider(
      create: (context) => HolidayModel(index),
      child: HolidayApp(),
    );
  }
}

class HolidayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Template(
      index: context.watch<HolidayModel>().index,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          body: Container(
            child: SfCalendar(
              view: CalendarView.month,
              todayHighlightColor: Colors.red,
              showNavigationArrow: true,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              dataSource: ScheduleDataSource(
                context.watch<HolidayModel>().holidays,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: context.read<HolidayModel>().add,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
