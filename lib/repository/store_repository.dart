import '../model/store.dart';

abstract class StoreRepository {
  Store read(String key);

  void write(String key, Store values);
}
