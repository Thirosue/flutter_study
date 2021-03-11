import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  static const String _title = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: const Text(
          _title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}