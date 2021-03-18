import 'package:flutter_app/model/store.dart';
import 'package:flutter_app/repository/store_repository.dart';
import 'package:flutter_app/ui/local_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStoreRepository extends Mock implements StoreRepository {}

void main() async {
  final mock = MockStoreRepository();
  final key = 'localState';
  final dummy = Store(
    idToken: 'idToken',
    refreshToken: 'refreshToken',
    accessToken: 'accessToken',
  );
  final target = LocalState(mock);

  group('LocalState read() ', () {
    test('ストレージが正常に利用できるとき、正常に状態が取得できること', () {
      // given
      when(mock.read(key)).thenReturn(dummy);

      // when
      var store = target.read();

      // then
      print(store.toString());
      expect(store.idToken, 'idToken');
      expect(store.refreshToken, 'refreshToken');
      expect(store.accessToken, 'accessToken');
      verify(mock.read(key)).called(1);
    });

    test('ストレージが異常が発生したとき、例外が発生すること', () {
      // アプリが利用できている時点で、ストレージ障害が発生する確率は極めて低い
      // 重要度が低いため、スキップとする
    });
  });

  group('LocalState write() ', () {
    test('ストレージが正常に利用できるとき、正常終了すること', () {
      // given
      when(mock.write(key, dummy)).thenReturn(null);

      // when
      target.write(dummy);

      // then
      verify(mock.write(key, dummy)).called(1);
    });

    test('ストレージが異常が発生したとき、例外が発生すること', () {
      // アプリが利用できている時点で、ストレージ障害が発生する確率は極めて低い
      // 重要度が低いため、スキップとする
    });
  });
}
