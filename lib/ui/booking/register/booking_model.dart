import 'package:flutter/material.dart';

import '../../../repository/booking_repository.dart';

class BookingModel extends ChangeNotifier {
  final BookingRepository repository;
  String request = '';

  BookingModel(this.repository);
}
