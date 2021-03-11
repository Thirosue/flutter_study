import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

part 'api_response.g.dart';

@freezed
abstract class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    List<dynamic>? data,
    required String message,
  }) = _ApiResponse;

  // static List<ApiResponse> toList(List<dynamic> json) =>
  //     json.map((value) => ApiResponse.fromJson(value)).toList();

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
