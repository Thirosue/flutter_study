import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../model/store.dart';

class StoreRepository {
  final box = GetStorage();

  Store read(String key) {
    var json = box.read(key);
    if (json != null) {
      return Store.fromJson(jsonDecode(json));
    } else {
      return const Store(
        idToken: '',
        refreshToken: '',
        accessToken: '',
      );
    }
  }

  void write(String key, Store values) {
    box.write(key, jsonEncode(values));
  }
}
