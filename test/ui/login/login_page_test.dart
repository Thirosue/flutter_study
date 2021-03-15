import 'package:flutter/material.dart';
import 'package:flutter_app/model/store.dart';
import 'package:flutter_app/repository/auth_repository.dart';
import 'package:flutter_app/repository/store_repository.dart';
import 'package:flutter_app/ui/local_state.dart';
import 'package:flutter_app/ui/login/login_model.dart';
import 'package:flutter_app/ui/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy/dummy_response.dart';
import '../utils/editable_text_utils.dart' show findRenderEditable;

class MockAuthRepository extends Mock implements AuthRepository {}

class MockStoreRepository extends Mock implements StoreRepository {}

void main() async {
  Get.testMode = true;

  final key = 'key';
  final state = Store(
    idToken: '',
    refreshToken: '',
    accessToken: '',
  );
  final response = await DummyResponse.getAuthPostResponse();

  final mockAuthRepository = MockAuthRepository();
  final mockStoreRepository = MockStoreRepository();
  when(mockStoreRepository.read(key)).thenReturn(state);
  when(mockStoreRepository.write(key, state)).thenReturn('write success !');

  GetMaterialApp loginApp() {
    return GetMaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginModel(
              mockAuthRepository,
            ),
          ),
          Provider(
            create: (context) => LocalState(
              mockStoreRepository,
            ),
          )
        ],
        child: LoginApp(),
      ),
    );
  }

  /// ///////////////////
  /// elements
  /// //////////////////
  final _id = find.byType(TextFormField).at(0);
  final _password = find.byType(TextFormField).at(1);
  final _submitButton = find.text('ログイン');
  final _passwordViewToggle = find.byType(IconButton);

  group('LoginPage ', () {
    testWidgets('1. 画面が表示されたとき、ログインボタンが存在すること', (tester) async {
      await tester.pumpWidget(loginApp());
      expect(_submitButton, findsOneWidget);
    });

    testWidgets('2. 画面が表示されたとき、入力チェックが動作していないこと', (tester) async {
      await tester.pumpWidget(loginApp());
      expect(find.text('入力してください'), findsNothing);
    });

    testWidgets('3. ユーザIDを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      await tester.pumpWidget(loginApp());

      await tester.enterText(_password, 'password');

      await tester.tap(_submitButton);
      await tester.pump();

      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsOneWidget);
      verifyNever(mockAuthRepository.auth());
    });

    testWidgets('4. パスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      await tester.pumpWidget(loginApp());

      await tester.enterText(_id, 'demo');

      await tester.tap(_submitButton);
      await tester.pump();

      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsOneWidget);
      verifyNever(mockAuthRepository.auth());
    });

    testWidgets('5. ユーザID、及びパスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      await tester.pumpWidget(loginApp());

      await tester.tap(_submitButton);
      await tester.pump();

      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsNWidgets(2));
      verifyNever(mockAuthRepository.auth());
    });

    testWidgets('5. ユーザID、及びパスワードを入力しログインボタンを押したとき、入力チェックが動作し、エラーとならないこと',
        (tester) async {
      await tester.pumpWidget(loginApp());
      when(mockAuthRepository.auth())
          .thenAnswer((_) => Future.value(response)); // 認証OK

      await tester.enterText(_password, 'password');
      await tester.enterText(_id, 'demo');

      await tester.tap(_submitButton);
      await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる

      expect(find.text('入力してください'), findsNothing);
      expect(find.text('パスワードが誤っています'), findsNothing);
      verify(mockAuthRepository.auth()).called(1);
    });

    testWidgets('6. パスワードを入力したとき、入力した文言がマスク(••••)されていること', (tester) async {
      await tester.pumpWidget(loginApp());
      await tester.enterText(_password, 'hoge');
      await tester.pump();

      final String editText = findRenderEditable(tester, 1).text!.text!;
      print(editText);

      expect(editText.substring(editText.length - 1), '\u2022');
    });

    testWidgets(
        '7. パスワードを入力し、パスワード表示アイコンを押したとき、入力した文言のマスクが解除されていること。もう一度パスワードマスクアイコンを押したとき、パスワードがマスクされること',
        (tester) async {
      await tester.pumpWidget(loginApp());
      await tester.enterText(_password, 'hoge');
      await tester.tap(_passwordViewToggle);
      await tester.pump();

      final String editText = findRenderEditable(tester, 1).text!.text!;
      print('unMask: $editText');

      expect(editText, 'hoge');

      await tester.tap(_passwordViewToggle);
      await tester.pump();

      final String editTextAfter = findRenderEditable(tester, 1).text!.text!;
      print('Mask: $editTextAfter');
      expect(editTextAfter.substring(editText.length - 1), '\u2022');
    });
  });
}
