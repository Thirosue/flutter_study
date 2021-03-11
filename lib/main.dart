import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'page_route_guard.dart';
import 'ui/index/index.dart';
import 'ui/login/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageRouteGuard = Get.put(PageRouteGuard());

    return GetMaterialApp(
      initialRoute: Constants.login,
      getPages: [
        GetPage(
          name: Constants.login,
          page: () {
            pageRouteGuard?.hook(Constants.login);
            return LoginPage();
          },
        ),
        GetPage(
          name: Constants.index,
          page: () => Index(),
        )
      ],
    );
  }
}
