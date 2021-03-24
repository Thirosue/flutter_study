import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
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
    final model = context.read<BookingModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.calendarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '予約日',
                  ),
                  onSaved: (value) => model.day = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '時刻',
                  ),
                  onSaved: (value) => model.time = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '時間枠',
                  ),
                  onSaved: (value) => model.cols,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '名前',
                  ),
                  onSaved: (value) => model.name = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '電話番号',
                  ),
                  onSaved: (value) => model.tel = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'メモ',
                  ),
                  onSaved: (value) => model.request = value!,
                ),
                const Gap(8),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await model.save();
                        }
                      },
                      child: const Text('予約する'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
