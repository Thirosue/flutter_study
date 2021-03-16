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
  when(mock.read(key)).thenReturn(dummy);
  when(mock.write(key, dummy)).thenReturn(null);

  final target = LocalState(mock);

  group('1. LocalState read() ', () {
    test('1-1. ストレージが正常に利用できるとき、正常に状態が取得できること', () {
      var store = target.read();

      print(store.toString());
      expect(store.idToken, 'idToken');
      expect(store.refreshToken, 'refreshToken');
      expect(store.accessToken, 'accessToken');
      verify(mock.read(key)).called(1);
    });

    test('1-2. ストレージが異常が発生したとき、例外が発生すること', () {
      when(mock.read(key)).thenThrow(Exception('storage error occurred'));

      expect(() => target.read(), throwsException);
      verify(mock.read(key)).called(1);
    });
  });

  group('2. LocalState write() ', () {
    test('2-1. ストレージが正常に利用できるとき、正常終了すること', () {
      target.write(dummy);

      verify(mock.write(key, dummy)).called(1);
    });

    test('1-2. ストレージが異常が発生したとき、例外が発生すること', () {
      when(mock.write(key, dummy))
          .thenThrow(Exception('storage error occurred'));

      expect(() => target.write(dummy), throwsException);
      verify(mock.write(key, dummy)).called(1);
    });
  });
}
