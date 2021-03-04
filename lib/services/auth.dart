import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app/models/response/api_response.dart';

class AuthService {
  static const String _baseUrl =
      'https://thirosue.github.io/hosting-image2/flutter_study';

  Future<ApiResponse> auth() async {
    var dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 500000,
      receiveTimeout: 100000,
      // 5s
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: Headers.jsonContentType,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.plain,
    ));

    Response response;
    response = await dio.get(
      '/auth.post.json',
    );

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.data.toString()));
    } else {
      throw Exception('Failed to auth');
    }
  }
}
