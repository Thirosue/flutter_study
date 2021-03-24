import 'package:flutter/material.dart';

import '../../../repository/booking_repository.dart';

class BookingModel extends ChangeNotifier {
  final BookingRepository repository;
  String day = '';
  String time = '';
  int cols = 2;
  String name = '';
  String tel = '';
  String request = '';

  BookingModel(this.repository);

  Future<void> save() async {
    print("time: $day $time, cols: $cols,"
        " name: $name, tel: $tel, request: $request");

    await repository.create();
  }
}
