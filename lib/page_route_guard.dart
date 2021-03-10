import 'package:get/get.dart';

import 'constants.dart';
import 'repository/store_repository_impl.dart';
import 'route_guard.dart';
import 'ui/local_state.dart';
import 'ui/login/login_guard.dart';

class PageRouteGuard extends GetxController {
  final _pageRouteGuard = <String, RouteGuard>{};

  PageRouteGuard() {
    _pageRouteGuard[Constants.login] = LoginGuard(
      LocalState(
        StoreRepositoryImpl(),
      ),
    );
  }

  void hook(String name) {
    print('next page: $name');
    if (_pageRouteGuard.containsKey(name)) {
      _pageRouteGuard[name]?.hook();
    }
  }
}
