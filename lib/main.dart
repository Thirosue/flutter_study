import 'package:flutter/material.dart';

import 'repository/auth.dart';
import 'repository/store.dart';
import 'ui/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Login(
        auth: AuthRepository(),
        store: StoreRepository(),
      ),
    );
  }
}
