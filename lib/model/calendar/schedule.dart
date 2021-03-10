import 'package:flutter/material.dart';

class Schedule {
  Schedule({
    required this.from,
    required this.to,
    required this.subject,
    this.background = Colors.lightBlue,
    this.isAllDay = false,
  });

  DateTime from;
  DateTime to;
  String subject;
  Color background;
  bool isAllDay;
}
