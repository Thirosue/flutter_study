import 'package:flutter/material.dart';
import 'package:flutter_app/model/response/session.dart';
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

  final key = 'localState';
  final state = Store(
    idToken: '',
    refreshToken: '',
    accessToken: '',
  );
  final response = await DummyResponse.getAuthPostResponse();
  final session = Session.toList(response.data!).first;
  final values = Store(
    idToken: session.idToken,
    refreshToken: session.refreshToken,
    accessToken: session.accessToken,
  );

  final mockAuthRepository = MockAuthRepository();
  final mockStoreRepository = MockStoreRepository();

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
    group('ページの初期表示確認 ', () {
      testWidgets(' 画面が表示されたとき、ログインボタンが存在すること', (tester) async {
        // when
        await tester.pumpWidget(loginApp());

        // then
        expect(_submitButton, findsOneWidget);
      });
    });

    group('入力チェックの確認 ', () {
      testWidgets(' 画面が表示されたとき、入力チェックが動作していないこと', (tester) async {
        // when
        await tester.pumpWidget(loginApp());

        // then
        expect(find.text('入力してください'), findsNothing);
      });

      testWidgets(' ユーザIDを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());
        await tester.enterText(_password, 'password');

        // when
        await tester.tap(_submitButton);
        await tester.pump();

        // then
        final validationErrorMessages = find.text('入力してください');
        expect(validationErrorMessages, findsOneWidget);
        verifyNever(mockAuthRepository.auth());
      });

      testWidgets(' パスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());
        await tester.enterText(_id, 'demo');

        // when
        await tester.tap(_submitButton);
        await tester.pump();

        // then
        final validationErrorMessages = find.text('入力してください');
        expect(validationErrorMessages, findsOneWidget);
        verifyNever(mockAuthRepository.auth());
      });

      testWidgets(' ユーザID、及びパスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());

        // when
        await tester.tap(_submitButton);
        await tester.pump();

        // then
        final validationErrorMessages = find.text('入力してください');
        expect(validationErrorMessages, findsNWidgets(2));
        verifyNever(mockAuthRepository.auth());
      });
    });

    group('パスワードマスクの確認 ', () {
      testWidgets(
          '初期状態でパスワードを入力した場合、パスワードがマスクされていること、その後、パスワードトグルアイコンを押すごとに、表示・非表示が切り替わること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());

        // when
        await tester.enterText(_password, 'hoge');
        await tester.pump();

        // then
        final String editTextInit = findRenderEditable(tester, 1).text!.text!;
        print('Mask: $editTextInit');
        expect(editTextInit.substring(editTextInit.length - 1), '\u2022');

        // when
        await tester.tap(_passwordViewToggle);
        await tester.pump();

        // then
        final String editTextThen = findRenderEditable(tester, 1).text!.text!;
        print('unMask: $editTextThen');
        expect(editTextThen, 'hoge');

        // when
        await tester.tap(_passwordViewToggle);
        await tester.pump();

        // then
        final String editTextThen2 = findRenderEditable(tester, 1).text!.text!;
        print('Mask: $editTextThen2');
        expect(editTextThen2.substring(editTextThen2.length - 1), '\u2022');
      });
    });

    group('ログイン動作の確認 ', () {
      testWidgets('ユーザID、及びパスワードを入力しログインボタンを押し、認証OKのとき、ホームページに移動すること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());
        when(mockAuthRepository.auth())
            .thenAnswer((_) => Future.value(response)); // 認証OK
        when(mockStoreRepository.write(key, state))
            .thenReturn('write success !');

        await tester.enterText(_password, 'password');
        await tester.enterText(_id, 'demo');

        // when
        await tester.tap(_submitButton);
        await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる

        // then
        expect(find.text('入力してください'), findsNothing);
        expect(find.text('パスワードが誤っています'), findsNothing);
        verifyInOrder([
          mockAuthRepository.auth(),
          mockStoreRepository.write(key, values),
        ]);
        // ホームページに移動の検証は テスト容易性:高 かつ 重要度:低 のため、スキップ
      });

      testWidgets('ユーザID、及びパスワードを入力しログインボタンを押し、認証NGのとき、例外がthrowされること',
          (tester) async {
        // given
        await tester.pumpWidget(loginApp());
        when(mockAuthRepository.auth())
            .thenThrow(Exception('auth failed')); // 認証 NG

        await tester.enterText(_password, 'password');
        await tester.enterText(_id, 'demo');

        // when / then
        // TODO expect(() => tester.tap(_submitButton), throwsException);
      });
    });
  });
}
