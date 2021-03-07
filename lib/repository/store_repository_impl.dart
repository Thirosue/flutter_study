import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../model/store.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/store.txt');
  }

  Future<Store> read() async {
    try {
      final file = await _localFile;
      var json = await file.readAsString();

      return Store.fromJson(jsonDecode(json));
    } on Exception catch (e) {
      print(e);
      return const Store(jwt: '');
    }
  }

  Future<File> write(Store values) async {
    final file = await _localFile;
    var json = values.toJson();

    return file.writeAsString(jsonEncode(json));
  }
}
