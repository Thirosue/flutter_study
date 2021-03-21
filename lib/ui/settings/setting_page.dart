import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../ui/component/template.dart';
import 'setting_model.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Get.parameters['index'];

    return ChangeNotifierProvider(
      create: (context) => SettingModel(index != null ? int.parse(index) : 0),
      child: SettingApp(),
    );
  }
}

class SettingApp extends StatelessWidget {
  static const String _title = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Template(
      index: context.watch<SettingModel>().index,
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
