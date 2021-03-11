import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../model/store.dart';
import '../../repository/auth_repository_impl.dart';
import '../../repository/store_repository_impl.dart';
import '../../ui/login/login_navigator.dart';
import '../local_state.dart';
import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginModel(
            AuthRepositoryImpl(),
          ),
        ),
        Provider(
          create: (context) => LocalState(
            StoreRepositoryImpl(),
          ),
        ),
        Provider(
          create: (context) => LoginNavigator(),
        )
      ],
      child: LoginApp(),
    );
  }
}

class LoginApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                  validator: context.read<LoginModel>().emptyValidator,
                  onChanged: (value) => context.read<LoginModel>().id = value,
                ),
                TextFormField(
                  obscureText: !context.watch<LoginModel>().showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'パスワードを入力してください',
                    suffixIcon: IconButton(
                      icon: Icon(context.watch<LoginModel>().showPassword
                          ? FontAwesomeIcons.solidEye
                          : FontAwesomeIcons.solidEyeSlash),
                      onPressed: () =>
                          context.read<LoginModel>().togglePasswordVisible(),
                    ),
                  ),
                  validator: context.read<LoginModel>().emptyValidator,
                  onChanged: (value) =>
                      context.read<LoginModel>().password = value,
                ),
                const Gap(8),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var session = await context.read<LoginModel>().auth();

                          context.read<LocalState>().write(
                                Store(
                                  idToken: session.idToken,
                                  refreshToken: session.refreshToken,
                                  accessToken: session.accessToken,
                                ),
                              );

                          context.read<LoginNavigator>().next('ログインしました');
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
