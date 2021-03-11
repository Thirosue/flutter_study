import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'repository/auth_repository_impl.dart';
import 'repository/store_repository_impl.dart';
import 'ui/index/index.dart';
import 'ui/local_state.dart';
import 'ui/login/login_middleware.dart';
import 'ui/login/login_page.dart';

/// /////////////////////////
/// Page Settings
/// /////////////////////////

// login page
final loginPage = GetPage(
  name: Constants.login,
  page: () => LoginPage(),
);

// index page
final indexPage = GetPage(
  name: Constants.index,
  page: () => Index(),
);

/// /////////////////////////
/// main
/// /////////////////////////

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // redirect settings
    var loginMiddleWare = LoginMiddleWare(
      localState: LocalState(
        StoreRepositoryImpl(),
      ),
      auth: AuthRepositoryImpl(),
    );
    loginMiddleWare.redirect(Constants.login);

    return GetMaterialApp(
      initialRoute: Constants.login,
      getPages: [
        loginPage,
        indexPage,
      ],
    );
  }
}
