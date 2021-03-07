import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../model/response/session.dart';
import '../../model/store.dart';
import '../../repository/auth_repository.dart';
import '../../repository/store_repository.dart';
import '../index/index.dart';

class Login extends StatefulWidget {
  Login({Key key, this.auth, this.store}) : super(key: key);

  final AuthRepository auth;
  final StoreRepository store;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String _id;
  String _password;

  void initState() {
    super.initState();
    print('login init');

    widget.store.read().then((value) {
      if (value.jwt.isNotEmpty) {
        print('jwt stored. value: ${value.jwt}');

        // TODO トークンリフレッシュ

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: const Text('自動ログインしました')),
        // );
        //
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Index(),
        //   ),
        // );
      }
    });
  }

  String _emptyValidator(value) {
    if (value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  Future<Session> _auth() async {
    print("id: $_id, password: $_password");

    var results = await widget.auth.auth();

    print(results.toString());

    var session = Session.toList(results.data);
    return session[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'UserId',
                    hintText: 'ユーザIDを入力してください',
                  ),
                  validator: _emptyValidator,
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
                      },
                    ),
                  ),
                  validator: _emptyValidator,
                  onChanged: (value) => _password = value,
                ),
                const Gap(8),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          var session = await _auth();

                          var jwt = session.jwt;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('ログインしました'),
                            ),
                          );

                          widget.store.write(
                            Store(jwt: jwt),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Index(),
                            ),
                          );
                        }
                      },
                      child: const Text('ログイン'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
