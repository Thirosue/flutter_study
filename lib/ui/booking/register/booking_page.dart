import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../repository/booking_repository.dart';
import 'booking_model.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime selected = Get.arguments;
    print(selected);

    return ChangeNotifierProvider(
      create: (context) => BookingModel(
        BookingRepository(),
      ),
      child: BookingApp(),
    );
  }
}

class BookingApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.calendarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Request',
                    ),
                    onSaved: (value) => context.read<BookingModel>().request,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
