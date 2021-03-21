import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../helpers/message_utils.dart';
import '../../model/response/session.dart';
import '../../model/store.dart';
import '../../repository/auth_repository.dart';
import '../local_state.dart';

class LoginMiddleWare extends GetMiddleware {
  final LocalState localState;
  final AuthRepository auth;

  LoginMiddleWare({
    required this.localState,
    required this.auth,
  });

  Future<bool> refreshToken() async {
    try {
      var results = await auth.refresh();
      var session = Session.toList(results.data!).first;

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

  @override
  RouteSettings? redirect(String? route) {
    print('login onInit. check token');

    var store = localState.read();
    if (store.idToken.isNotEmpty) {
      print('Refresh Token stored. value: ${store.idToken}');

      refreshToken().then((result) {
        if (result) {
          print('token refreshed... go to index page.');

          // auto login
          Get.toNamed(
            Constants.calendar,
            parameters: {'index': '0'},
          );
          if (!Get.isSnackbarOpen!) {
            MessageUtils.showSnackBar('ログイン', '自動ログインしました');
          }
        }
      });

      return null;
    }
  }
}
