import 'package:flutter/material.dart';

class Schedule {
  Schedule({
    this.from,
    this.to,
    this.subject,
    this.background,
    this.isAllDay,
  });

  DateTime from;
  DateTime to;
  String subject;
  Color background;
  bool isAllDay;
}
