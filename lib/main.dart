import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Login(
        auth: AuthService(),
        store: StoreService(),
      ),
    );
  }
}
