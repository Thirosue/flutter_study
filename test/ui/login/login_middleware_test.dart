import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/response/session.dart';
import 'package:flutter_app/model/store.dart';
import 'package:flutter_app/repository/auth_repository.dart';
import 'package:flutter_app/ui/local_state.dart';
import 'package:flutter_app/ui/login/login_middleware.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_index_page.dart';
import '../../dummy/dummy_page.dart';
import '../../dummy/dummy_response.dart';

class MockLocalState extends Mock implements LocalState {}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() async {
  Get.testMode = true;

  final mockAuthRepository = MockAuthRepository();
  final response = await DummyResponse.getAuthPostResponse();

  final mockLocalState = MockLocalState();
  final session = Session.toList(response.data!).first;
  final values = Store(
    idToken: session.idToken,
    refreshToken: session.refreshToken,
    accessToken: session.accessToken,
  );

  final target = LoginMiddleWare(
    localState: mockLocalState,
    auth: mockAuthRepository,
  );

  group('1. LoginMiddleWare refreshToken() ', () {
    test('1-1. 認証APIとストレージが正常のとき、トークンが正常にリフレッシュされること', () async {
      // given
      when(mockAuthRepository.refresh())
          .thenAnswer((_) => Future.value(response));
      when(mockLocalState.write(values)).thenReturn(null);

      // when
      final result = await target.refreshToken();

      // then
      expect(result, true);
      verifyInOrder([
        mockAuthRepository.refresh(),
        mockLocalState.write(values),
      ]);
    });

    test('1-2. 認証APIで例外が発生したとき、トークンリフレッシュ結果が false となること', () async {
      // given
      when(mockAuthRepository.refresh()).thenThrow(Exception('api error'));
      when(mockLocalState.write(values)).thenReturn(null);

      // when
      final result = await target.refreshToken();

      // then
      expect(result, false);
      verify(mockAuthRepository.refresh()).called(1);
      verifyNever(mockLocalState.write(values));
    });

    test('1-3. ストレージ書き込みで例外が発生したとき、トークンリフレッシュ結果が false となること', () async {
      // given
      when(mockAuthRepository.refresh())
          .thenAnswer((_) => Future.value(response));
      when(mockLocalState.write(values)).thenThrow(Exception('storage error'));

      // when
      final result = await target.refreshToken();

      // then
      expect(result, false);
      verifyInOrder([
        mockAuthRepository.refresh(),
        mockLocalState.write(values),
      ]);
    });
  });

  group('2. LoginMiddleWare toIndex() ', () {
    testWidgets('2-1. indexPageへを呼び出したとき、画面遷移が正常終了すること', (tester) async {
      final loginPage = DummyPage();
      final indexPage = DummyIndexPage();

      // given
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: Constants.login,
          getPages: [
            GetPage(
              name: Constants.login,
              page: () => loginPage,
            ),
            GetPage(
              name: Constants.index,
              page: () => indexPage,
            ),
          ],
        ),
      );
      expect(find.byWidget(loginPage), findsOneWidget);

      // when
      target.toIndex();
      await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
      await tester.pumpAndSettle();

      // then
      expect(find.byWidget(indexPage), findsOneWidget);
    });
  });

  group('3. LoginMiddleWare redirect() ', () {
    group('a. 正常系の確認', () {
      testWidgets('1. アプリを利用したことがない場合、ログインページからスタートすること', (tester) async {
        // given
        final loginPage = DummyPage();
        final indexPage = DummyIndexPage();
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: Constants.login,
            getPages: [
              GetPage(
                name: Constants.login,
                page: () => loginPage,
              ),
              GetPage(
                name: Constants.index,
                page: () => indexPage,
              ),
            ],
          ),
        );
        when(mockLocalState.read()).thenReturn(Store(
          idToken: '',
          refreshToken: '',
          accessToken: '',
        ));
        expect(find.byWidget(loginPage), findsOneWidget);

        // when
        target.redirect(Constants.index);

        await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        expect(find.byWidget(loginPage), findsOneWidget);
        verify(mockLocalState.read()).called(1);
        verifyNever(mockAuthRepository.refresh());
      });

      testWidgets(
          '2. アプリを利用したことがあり（＝前回ログイン情報がストレージに保存されている）、トークンが有効な場合、ホームページにリダイレクトされること',
          (tester) async {
        // given
        final loginPage = DummyPage();
        final indexPage = DummyIndexPage();
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: Constants.login,
            getPages: [
              GetPage(
                name: Constants.login,
                page: () => loginPage,
              ),
              GetPage(
                name: Constants.index,
                page: () => indexPage,
              ),
            ],
          ),
        );
        when(mockLocalState.read()).thenReturn(Store(
          idToken: 'valid',
          refreshToken: 'valid',
          accessToken: 'valid',
        ));
        when(mockLocalState.write(values)).thenReturn(null);
        when(mockAuthRepository.refresh())
            .thenAnswer((_) => Future.value(response));
        expect(find.byWidget(loginPage), findsOneWidget);

        // when
        target.redirect(Constants.index);

        await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        expect(find.byWidget(indexPage), findsOneWidget);
        verifyInOrder([
          mockLocalState.read(),
          mockAuthRepository.refresh(),
          mockLocalState.write(values),
        ]);
      });

      testWidgets(
          '3. アプリを利用したことがあり（＝前回ログイン情報がストレージに保存されている）、トークンが無効な場合、ログインページからスタートすること',
          (tester) async {
        // given
        final loginPage = DummyPage();
        final indexPage = DummyIndexPage();
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: Constants.login,
            getPages: [
              GetPage(
                name: Constants.login,
                page: () => loginPage,
              ),
              GetPage(
                name: Constants.index,
                page: () => indexPage,
              ),
            ],
          ),
        );
        when(mockLocalState.read()).thenReturn(Store(
          idToken: 'valid',
          refreshToken: 'valid',
          accessToken: 'valid',
        ));
        when(mockAuthRepository.refresh())
            .thenThrow(Exception('token invalid'));
        expect(find.byWidget(loginPage), findsOneWidget);

        // when
        target.redirect(Constants.index);

        await tester.pump(Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        expect(find.byWidget(loginPage), findsOneWidget);
        verifyInOrder([
          mockLocalState.read(),
          mockAuthRepository.refresh(),
        ]);
        verifyNever(mockLocalState.write(values));
      });
    });

    group('b. 異常系の確認', () {
      test('1. ストレージ読み込みで例外が発生したとき、例外をthrowすること', () async {
        // given
        when(mockLocalState.read()).thenThrow(Exception('storage error'));

        // when / then
        expect(() => target.redirect(Constants.index), throwsException);
      });
    });
  });
}
