import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:b2b_mvp/shared/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icons_plus/icons_plus.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
  Atom<AuthModel> authModelState = controller.authModelState;
    print('build widget');
    return RxBuilder(builder: (context) {
      print('build rx');
      AuthModel authModel = authModelState.value;
      return Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'e-mail'),
              onChanged: (value) {
                authModel = authModel.copyWith(email: value);
                authModelState.value = authModel;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'password'),
              onChanged: (value) {
                authModel = authModel.copyWith(password: value);
                authModelState.value = authModel;
              },
            ),
            TextButton(
              onPressed: () {},
              child: const Text('login'),
            ),
            IconButton(
              onPressed: () {
                controller.googleSignIn();
              },
              icon: const Icon(Bootstrap.google),
            ),
            Text(authModel.email ?? ''),
            Text(authModel.password ?? ''),
          ],
        ),
      );
    });
  }
}
