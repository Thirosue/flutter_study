import 'dart:convert';

import 'package:flutter_app/models/response/api_response.dart';
import 'package:flutter_app/models/store.dart';

class JsonConverter {
  // json sample
  static Future<dynamic> jsonFileLoad() async {
    var _json = '''
{
    "data": [
      {
        "id": "demo",
        "first_name": "john",
        "last_name": "doe",
        "email": "sample@exsample.com",
        "tel": "09012345678",  
        "roles": [
          "system_admin"
        ],
        "permission_key_list": [
          ".*"
        ],
        "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
      }
    ],
    "message": "正常終了"
}
''';

    return ApiResponse.fromJson(jsonDecode(_json));
  }

  static Future<dynamic> storeJson() async {
    var _json = '''
{
    "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
}
    ''';

    return Store.fromJson(jsonDecode(_json));
  }
}
