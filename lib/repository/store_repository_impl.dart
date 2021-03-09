import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../model/store.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final box = GetStorage();

  Store read(String key) {
    var json = box.read(key);
    if (json != null) {
      return Store.fromJson(jsonDecode(json));
    } else {
      return const Store(jwt: '');
    }
  }

  void write(String key, Store values) {
    box.write(key, jsonEncode(values));
  }
}
