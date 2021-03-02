import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const String _title = 'Login';

  final _formKey = GlobalKey<FormState>();
  static bool _showPassword = false;
  String _id;
  String _password;

  void initState() {
    super.initState();
    print('login init');
    // JsonConverter.jsonFileLoad().then((value) => print(value.message));
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
                  labelText: 'UserId',
                  hintText: 'ユーザIDを入力してください',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
                onChanged: (value) => _id = value,
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
                      print(_id);
                      print(_password);

                      AuthService.auth().then((value) {
                        print(value.message);
                        print(value.data[0].jwt);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: const Text('ログインしました')),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Index(),
                          ),
                        );
                      });
                    }
                  },
                  child: Text('ログイン'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
