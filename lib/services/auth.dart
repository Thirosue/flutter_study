import 'dart:convert';

import 'package:flutter_app/dto/response.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _url =
      'https://thirosue.github.io/hosting-image2/flutter_study/auth.post.json';

  static Future<Response> auth() async {
    final response =
        await http.get(_url, headers: {'content-type': 'application/json'});

    if (response.statusCode == 200) {
      return Response.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to auth');
    }
  }
}
