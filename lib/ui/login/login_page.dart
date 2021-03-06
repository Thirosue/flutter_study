import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../helpers/message_utils.dart';
import '../../model/store.dart';
import '../../repository/auth_repository.dart';
import '../../repository/store_repository.dart';
import '../local_state.dart';
import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginModel(
            AuthRepository(),
          ),
        ),
        Provider(
          create: (context) => LocalState(
            StoreRepository(),
          ),
        ),
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
                  onSaved: (value) => context.read<LoginModel>().id = value!,
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
                  onSaved: (value) =>
                      context.read<LoginModel>().password = value!,
                ),
                const Gap(8),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          var session = await context.read<LoginModel>().auth();

                          context.read<LocalState>().write(
                                Store(
                                  idToken: session.idToken,
                                  refreshToken: session.refreshToken,
                                  accessToken: session.accessToken,
                                ),
                              );

                          Get.toNamed(Constants.calendar);
                          MessageUtils.showSnackBar('ログイン', 'ログインしました');
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
