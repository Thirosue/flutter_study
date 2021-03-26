import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../repository/booking_repository.dart';
import '../../../ui/component/custom_text_form_field.dart';
import '../../../ui/component/dropdown_form_field.dart';
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
                CustomTextFormField(
                  titleText: '予約日',
                  validator: model.emptyValidator,
                  onSaved: (value) => model.day = value!,
                ),
                CustomTextFormField(
                  titleText: '時刻',
                  onSaved: (value) => model.time = value!,
                ),
                const Gap(8),
                DropDownFormField(
                  titleText: '予約枠',
                  items: model.colsItems,
                  value: context.watch<BookingModel>().cols,
                  onChanged: (value) => model.setCols(value!),
                ),
                CustomTextFormField(
                  titleText: '名前',
                  onSaved: (value) => model.name = value!,
                ),
                CustomTextFormField(
                  titleText: '電話番号',
                  onSaved: (value) => model.tel = value!,
                ),
                CustomTextFormField(
                  titleText: 'メモ',
                  onSaved: (value) => model.request = value!,
                  maxLines: 5,
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
