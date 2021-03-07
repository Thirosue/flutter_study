import 'dart:io';

import '../model/store.dart';

abstract class StoreRepository {
  Future<Store> read();

  Future<File> write(Store values);
}
