import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Login(),
    );
  }
}
