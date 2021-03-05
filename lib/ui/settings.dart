import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String _title = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: const Text(_title),
      ),
    );
  }
}
