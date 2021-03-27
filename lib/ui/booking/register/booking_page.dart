import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../helpers/message_utils.dart';
import '../../../repository/booking_repository.dart';
import '../../component/atoms/custom_text_form_field.dart';
import '../../component/atoms/dropdown_form_field.dart';
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputDecorator(
                        decoration: const InputDecoration(
                          labelText: '予約日',
                          fillColor: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150,
                              height: 32,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  context.watch<BookingModel>().dayText,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 32,
                              child: Align(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () => model.selectDate(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      child: DropDownFormField(
                        titleText: '時間',
                        items: model.hourItems,
                        value: context.watch<BookingModel>().hour,
                        onChanged: (value) => model.setHour(value!),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: DropDownFormField(
                        titleText: '分',
                        items: model.minuteItems,
                        value: context.watch<BookingModel>().minute,
                        onChanged: (value) => model.setMinute(value!),
                      ),
                    ),
                  ],
                ),
                DropDownFormField(
                  titleText: '予約枠',
                  items: model.colsItems,
                  value: context.watch<BookingModel>().cols,
                  onChanged: (value) => model.setCols(value!),
                ),
                CustomTextFormField(
                  titleText: '名前',
                  validator: model.emptyValidator,
                  onSaved: (value) => model.name = value!,
                ),
                CustomTextFormField(
                  titleText: '電話番号',
                  onSaved: (value) => model.tel = value!,
                ),
                CustomTextFormField(
                  titleText: 'メモ',
                  onSaved: (value) => model.request = value!,
                  maxLines: 3,
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

                          Get.back();
                          MessageUtils.showSnackBar('予約', '予約を編集しました');
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
