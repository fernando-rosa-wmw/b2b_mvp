import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/interfaces/services/sign_in_service.dart';

class AuthController extends ChangeNotifier {
  final SignInService googleSignInService = Modular.get();

  final authModelState = Atom<AuthModel>(AuthModel());

  googleSignIn() async {
    authModelState.value = await googleSignInService.handleSignIn();
    Modular.to.navigate('/sale');
  }

  void disconnect() async {
    googleSignInService.handleSignOut();
    Modular.to.navigate('/auth');
  }
}
