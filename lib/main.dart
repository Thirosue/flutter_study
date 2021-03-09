import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'ui/index/index.dart';
import 'ui/login/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Constants.login,
      getPages: [
        GetPage(
            name: Constants.login,
            page: () {
              print('init');
              return LoginPage();
            }),
        GetPage(
          name: Constants.index,
          page: () => Index(),
        )
      ],
    );
  }
}
