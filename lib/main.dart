import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: MyStateFulWidget(),
      ),
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  MyStateFulWidget({Key key}) : super(key: key);

  @override
  _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  final _formKey = GlobalKey<FormState>();
  static const bool _showPassword = false;
  String _email;
  String _password;

  void _handlePasswordIconPressed() {}

  @override
  Widget build(BuildContext context) {
    return Form(
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
              onSaved: (value) {
                _email = value;
              },
            ),
            TextFormField(
              obscureText: !_showPassword,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'パスワードを入力してください',
                suffixIcon: IconButton(
                  onPressed: null, // TODO パスワード表示切り替え
                  icon: Icon(_showPassword
                      ? FontAwesomeIcons.solidEye
                      : FontAwesomeIcons.solidEyeSlash),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '入力してください';
                }
                return null;
              },
              onSaved: (value) {
                _password = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(_email);
                    print(_password);
                    
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
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
