import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/model/response/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

class DummyResponse {
  static Future<ApiResponse> getAuthPostResponse() async {
    var json = await File('${Directory.current.path}/test/dummy/auth.post.json')
        .readAsString();
    return ApiResponse.fromJson(jsonDecode(json));
  }
}
