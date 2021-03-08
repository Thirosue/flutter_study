import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'booking_model.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingModel(),
      child: BookingApp(),
    );
  }
}

class BookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        body: Container(
          child: const Text(
            'Booking',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Booking',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
