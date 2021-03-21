import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../ui/component/template.dart';
import 'setting_model.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Constants.settingIndex;

    return ChangeNotifierProvider(
      create: (context) => SettingModel(index),
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
