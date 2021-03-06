import 'package:flutter/material.dart';

@immutable
class Constants {
  static const String login = '/login';
  static const String calendar = '/';
  static const String day = '/day';
  static const String booking = '/booking';
  static const String holiday = '/holiday';
  static const String settings = '/settings';

  static const int calendarIndex = 0;
  static const int holidayIndex = 1;
  static const int settingIndex = 2;

  static const String calendarTitle = '予約編集';
  static const String holidayTitle = '店休日設定';
  static const String settingTitle = '設定変更';
}
