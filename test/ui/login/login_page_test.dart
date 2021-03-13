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

  GetMaterialApp build() {
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
  /// widgets
  /// //////////////////
  final target = build();

  /// ///////////////////
  /// elements
  /// //////////////////
  final id = find.byType(TextFormField).at(0);
  final password = find.byType(TextFormField).at(1);
  final emptyText = find.text('入力してください');
  final submit = find.text('ログイン');
  final passwordMaskToggle = find.byType(IconButton);
  final passwordText = 'hoge';

  group('LoginPage ', () {
    testWidgets('1. 画面が表示されたとき、ログインボタンが存在すること', (tester) async {
      await tester.pumpWidget(target);
      expect(submit, findsOneWidget);
    });

    testWidgets('2. 画面が表示されたとき、入力チェックが動作していないこと', (tester) async {
      await tester.pumpWidget(target);
      expect(emptyText, findsNothing);
    });

    testWidgets('3. ユーザIDを空でログインボタンを推したとき、入力チェックが動作し、エラーとなること', (tester) async {
      await tester.pumpWidget(target);

      await tester.enterText(password, 'password');

      await tester.tap(submit);
      await tester.pump();

      expect(emptyText, findsOneWidget);
    });

    testWidgets('4. パスワードを空でログインボタンを推したとき、入力チェックが動作し、エラーとなること', (tester) async {
      await tester.pumpWidget(target);

      await tester.enterText(id, 'demo');

      await tester.tap(submit);
      await tester.pump();

      expect(emptyText, findsOneWidget);
    });

    testWidgets('5. ユーザID、及びパスワードを空でログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      await tester.pumpWidget(target);

      await tester.tap(submit);
      await tester.pump();

      expect(emptyText.at(0), findsOneWidget);
      expect(emptyText.at(1), findsOneWidget);
    });

    testWidgets('5. ユーザID、及びパスワードを入力しログインボタンを押したとき、入力チェックが動作し、エラーとならないこと',
        (tester) async {
      await tester.pumpWidget(target);
      when(mockAuthRepository.auth()).thenAnswer((_) => Future.value(response));

      await tester.enterText(password, 'password');
      await tester.enterText(id, 'demo');

      await tester.tap(submit);
      await tester.pump(Duration(seconds: 10)); // SnackBarが表示されるのを待ち合わせる

      expect(emptyText, findsNothing);
    });

    testWidgets('6. パスワードを入力したとき、入力した文言がマスク(••••)されていること', (tester) async {
      await tester.pumpWidget(target);
      await tester.enterText(password, passwordText);
      await tester.pump();

      final String editText = findRenderEditable(tester, 1).text!.text!;
      print(editText);

      expect(editText.substring(editText.length - 1), '\u2022');
    });

    testWidgets(
        '6. パスワードを入力し、パスワード表示アイコンを押したとき、入力した文言のマスクが解除されていること。もう一度パスワードマスクアイコンを押したとき、パスワードがマスクされること',
        (tester) async {
      await tester.pumpWidget(target);
      await tester.enterText(password, passwordText);
      await tester.tap(passwordMaskToggle);
      await tester.pump();

      final String editText = findRenderEditable(tester, 1).text!.text!;
      print('unMask: $editText');

      expect(editText, 'hoge');

      await tester.tap(passwordMaskToggle);
      await tester.pump();

      final String editTextAfter = findRenderEditable(tester, 1).text!.text!;
      print('Mask: $editTextAfter');
      expect(editTextAfter.substring(editText.length - 1), '\u2022');
    });
  });
}
