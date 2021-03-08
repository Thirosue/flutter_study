import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'ui/index/index.dart';
import 'ui/login/login_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Constants.login,
      routes: {
        Constants.login: (context) => LoginPage(),
        Constants.index: (context) => Index(),
      },
    );
  }
}
