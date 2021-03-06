import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String idToken,
    required String refreshToken,
    required String accessToken,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
