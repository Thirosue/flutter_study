import 'package:flutter/material.dart';

import '../model/store.dart';
import '../repository/store_repository.dart';

class LocalState extends ChangeNotifier {
  final StoreRepository repository;

  Store store;

  LocalState(this.repository);

  Future<Store> read() {
    return repository.read();
  }

  Future<void> write(Store values) async {
    await repository.write(values);
  }
}
