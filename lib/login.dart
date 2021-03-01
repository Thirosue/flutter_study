import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/dto/auth.dart';
import 'package:flutter_app/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const String _title = 'Login';
  static const String _url =
      'https://raw.githubusercontent.com/Thirosue/hosting-image2/master/flutter_study/auth.post.json';

  final _formKey = GlobalKey<FormState>();
  static bool _showPassword = false;
  String _email;
  String _password;

  void initState() {
    super.initState();
    print('login init');
    _jsonFileLoad().then((value) {
      print(value);
      print(value.message);
      print(value.data[0].jwt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'メールアドレスを入力してください',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
                onChanged: (value) => _email = value,
              ),
              TextFormField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'パスワードを入力してください',
                    suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash),
                        onPressed: () => {
                              setState(() {
                                _showPassword = !_showPassword;
                              })
                            })),
                validator: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
                onChanged: (value) => _password = value,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(_email);
                      print(_password);

                      Map<String, String> headers = {
                        'content-type': 'application/json'
                      };

                      // TODO 戻るとエラーになる
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Menu(),
                      //   ),
                      // );
                    }
                  },
                  child: Text('ログイン'),
                ),
              ),
              ElevatedButton(
                child: Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Index()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // json sample
  Future<dynamic> _jsonFileLoad() async {
    String _json = '''{
    "data": [
      {
        "id": "demo",
        "firstName": "john",
        "lastName": "doe",
        "email": "sample@exsample.com",
        "tel": "09012345678",  
        "roles": [
          "system_admin"
        ],
        "permissionKeyList": [
          ".*"
        ],
        "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
      }
    ],
    "message": "正常終了"
}''';
    return Response.fromJson(jsonDecode(_json));
  }
}
