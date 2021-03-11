import 'package:get/get.dart';

import '../../constants.dart';
import '../../helpers/message_utils.dart';
import '../../model/response/session.dart';
import '../../model/store.dart';
import '../../repository/auth_repository.dart';
import '../../route_guard.dart';
import '../local_state.dart';

class LoginGuard extends RouteGuard {
  final LocalState localState;
  final AuthRepository auth;

  LoginGuard({
    required this.localState,
    required this.auth,
  });

  Future<bool> refreshToken() async {
    try {
      var results = await auth.refresh();
      var session = Session.toList(results.data!)[0];

      localState.write(
        Store(
          idToken: session.idToken,
          refreshToken: session.refreshToken,
          accessToken: session.accessToken,
        ),
      );

      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  void redirect() {
    Get.toNamed(Constants.index);
    if (!Get.isSnackbarOpen!) {
      MessageUtils.showSnackBar('ログイン', '自動ログインしました');
    }
  }

  @override
  void hook() async {
    print('login onInit');
    var store = localState.read();
    if (store.idToken.isNotEmpty) {
      print('Refresh Token stored. value: ${store.idToken}');

      var result = await refreshToken();
      if (result) {
        print('token refreshed... go to index page.');

        // auto login
        redirect();
      }
    }
  }
}
