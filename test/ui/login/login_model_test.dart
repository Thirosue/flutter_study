// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_app/model/response/api_response.dart';
import 'package:flutter_app/repository/auth_repository.dart';
import 'package:flutter_app/ui/login/login_model.dart';
import 'package:flutter_test/flutter_test.dart';

final _json = '''
{
    "data": [
      {
        "id": "demo",
        "first_name": "john",
        "last_name": "doe",
        "email": "sample@exsample.com",
        "tel": "09012345678",  
        "roles": [
          "system_admin"
        ],
        "permission_key_list": [
          ".*"
        ],
        "idToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
      }
    ],
    "message": "正常終了"
}
''';

final response = ApiResponse.fromJson(
  jsonDecode(_json),
);

// class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthRepository implements AuthRepository {
  Future<ApiResponse> auth() async {
    return response;
  }

  Future<ApiResponse> refresh() async {
    return response;
  }
}

void main() {
  group('LoginModel auth() ', () {
    test('1-1. 認証APIが正常終了するとき、セッションの中身が正常に検証できること', () async {
      var mock = MockAuthRepository();

      // when(mock.auth()).thenAnswer((_) {
      //   return Future.value(response);
      // });

      var target = LoginModel(mock);
      var session = await target.auth();

      expect(session.idToken,
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c");
    });
  });
}
