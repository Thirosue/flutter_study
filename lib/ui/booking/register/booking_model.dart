import 'package:flutter/material.dart';

import '../../../repository/booking_repository.dart';

class BookingModel extends ChangeNotifier {
  final BookingRepository repository;
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

  String day = '';
  String time = '';
  int cols = 4;
  String name = '';
  String tel = '';
  String request = '';

  BookingModel(this.repository);

  void setCols(int value) {
    cols = value;
    notifyListeners();
  }

  String? emptyValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  Future<void> save() async {
    print("time: $day $time, cols: $cols,"
        " name: $name, tel: $tel, request: $request");

    await repository.create();
  }
}
