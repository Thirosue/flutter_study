import 'package:flutter/material.dart';

import '../../model/response/session.dart';
import '../../repository/auth_repository.dart';

class LoginModel extends ChangeNotifier {
  final AuthRepository repository;
  String id = '';
  String password = '';
  bool showPassword = false;

  LoginModel(this.repository);

  void togglePasswordVisible() {
    showPassword = !showPassword;
    notifyListeners();
  }

  String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  Future<Session> auth() async {
    print("id: $id, password: $password");

    var results = await repository.auth();

    print(results.toString());

    var session = Session.toList(results.data);
    return session[0];
  }
}
