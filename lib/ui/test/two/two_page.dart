import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../component/template.dart';
import 'two_model.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Get.parameters['index'];

    return ChangeNotifierProvider(
      create: (context) => TwoModel(index != null ? int.parse(index) : 0),
      child: TwoApp(),
    );
  }
}

class TwoApp extends StatelessWidget {
  static const String _title = 'Two';

  @override
  Widget build(BuildContext context) {
    return Template(
      index: context.watch<TwoModel>().index,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: const Text(
            _title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
