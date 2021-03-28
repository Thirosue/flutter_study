import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/message_utils.dart';
import '../../../model/calendar/booking.dart';
import '../../../repository/booking_repository.dart';

class BookingModel extends ChangeNotifier {
  BookingRepository repository;
  DateTime day;
  String hour;
  String minute;
  int cols = 4;
  String name = '';
  String tel = '';
  String request = '';

  BookingModel({
    required this.repository,
    required this.day,
    required this.hour,
    required this.minute,
  });

  String? emptyValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  Future<Null> selectDate(BuildContext context, [DateTime? at]) async {
    final picked = (await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 60),
      ),
      initialDate: at != null ? at : DateTime.now(),
    ))!;

    day = picked;
    notifyListeners();
  }

  void setHour(String value) {
    hour = value;
    notifyListeners();
  }

  void setMinute(String value) {
    minute = value;
    notifyListeners();
  }

  void setCols(int value) {
    cols = value;
    notifyListeners();
  }

  Future<void> save() async {
    final start = DateTime(
      day.year,
      day.month,
      day.day,
      int.parse(hour),
      int.parse(minute),
    );
    final booking = Booking(
      day: DateFormat('yyyyMMdd').format(day),
      time: start.microsecondsSinceEpoch,
      at: hour + minute,
      cols: cols,
      dateText: DateFormat('yyyy-MM-dd HH:mm').format(start),
      name: name,
      tel: tel,
      request: request,
    );

    print(booking.toString());
    await repository.create(booking);
  }

  final colsItems = [
    {
      "display": "1時間枠",
      "value": 2,
    },
    {
      "display": "2時間枠",
      "value": 4,
    },
    {
      "display": "3時間枠",
      "value": 6,
    },
  ];

  final hourItems = List.generate(11, (i) => i + 10)
      .map((hour) => {
            "display": MessageUtils.paddingTimeOfDay(hour),
            "value": MessageUtils.paddingTimeOfDay(hour),
          })
      .toList();

  final minuteItems = [
    {
      "display": "00",
      "value": "00",
    },
    {
      "display": "30",
      "value": "30",
    },
  ];
}
