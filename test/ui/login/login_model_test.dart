import 'package:flutter_app/repository/auth_repository.dart';
import 'package:flutter_app/ui/login/login_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_response.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() async {
  final mock = MockAuthRepository();
  final response = await DummyResponse.getAuthPostResponse();

  group('LoginModel auth() ', () {
    test('認証APIが正常終了するとき、セッションの中身が正常に検証できること', () async {
      // given
      when(mock.auth()).thenAnswer((_) => Future.value(response));
      var model = LoginModel(mock);

      // when
      var session = await model.auth();

      // then
      expect(session.idToken,
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c");
      verify(mock.auth()).called(1);
    });

    test('認証APIが異常終了するとき、例外がthrowされること', () async {
      // given
      when(mock.auth()).thenThrow(
        Exception('api error occurred'),
      );
      var model = LoginModel(mock);

      // when / then
      expect(() => model.auth(), throwsException);
      verify(mock.auth()).called(1);
    });
  });

  final target = LoginModel(
    MockAuthRepository(),
  );

  group('LoginModel emptyValidator ', () {
    test('value が null のとき、エラー文言を返すこと', () {
      // when
      var message = target.emptyValidator(null);

      // then
      print(message);
      expect(message?.isNotEmpty, true);
    });

    test('value が 空文字 のとき、エラー文言を返すこと', () {
      // when
      var message = target.emptyValidator('');

      // then
      print(message);
      expect(message?.isNotEmpty, true);
    });

    test('value が 半角スペース のとき、nullを返すこと', () {
      // when
      var message = target.emptyValidator(' ');

      // then
      expect(message, null);
    });

    test('value が 全角スペース のとき、nullを返すこと', () {
      // when
      var message = target.emptyValidator('　');

      // then
      expect(message, null);
    });

    test('value が 文字列「password」 のとき、nullを返すこと', () {
      // when
      var message = target.emptyValidator('password');

      // then
      expect(message, null);
    });
  });

  group('LoginModel togglePasswordVisible() ', () {
    test('toggleをコールするごとに、showPasswordが切り替わること', () {
      // given
      expect(target.showPassword, false);

      // when
      target.togglePasswordVisible();

      // then
      expect(target.showPassword, true);

      // when
      target.togglePasswordVisible();

      // then
      expect(target.showPassword, false);
    });
  });
}
