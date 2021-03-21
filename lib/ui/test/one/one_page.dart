import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../component/template.dart';
import 'one_model.dart';

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Get.parameters['index'];

    return ChangeNotifierProvider(
      create: (context) => OneModel(index != null ? int.parse(index) : 0),
      child: OneApp(),
    );
  }
}

class OneApp extends StatelessWidget {
  static const String _title = 'One';

  @override
  Widget build(BuildContext context) {
    return Template(
      index: context.watch<OneModel>().index,
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
