import '../model/store.dart';

abstract class StoreRepository {
  Future<Store> read();

  Future<void> write(Store values);
}
