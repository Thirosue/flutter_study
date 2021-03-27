import 'package:flutter/material.dart';
import 'package:flutter_app/route_navigate_observer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'repository/auth_repository.dart';
import 'repository/calendar_repository.dart';
import 'repository/store_repository.dart';
import 'ui/booking/calendar_page.dart';
import 'ui/holiday/holiday_page.dart';
import 'ui/local_state.dart';
import 'ui/login/login_middleware.dart';
import 'ui/login/login_page.dart';
import 'ui/settings/setting_page.dart';

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
    final loginMiddleWare = LoginMiddleWare(
      localState: LocalState(
        StoreRepository(),
      ),
      auth: AuthRepository(),
    );
    loginMiddleWare.redirect(Constants.login);

    return GetMaterialApp(
      navigatorObservers: [
        RouteNavigateObserver(),
      ],
      initialRoute: Constants.login,
      getPages: [
        GetPage(
          name: Constants.login,
          page: () => LoginPage(),
        ),
        GetPage(
          name: Constants.calendar,
          page: () => CalendarPage(
            repository: CalendarRepository(),
          ),
        ),
        GetPage(
          name: Constants.holiday,
          page: () => HolidayPage(),
        ),
        GetPage(
          name: Constants.settings,
          page: () => SettingPage(),
        ),
      ],
    );
  }
}
