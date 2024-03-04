import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:b2b_mvp/modules/auth/services/google_signin_service.dart';
import 'package:b2b_mvp/shared/interfaces/sign_in_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add(AuthController.new);
    i.add<SignInService>(GoogleSignInService.new);
    i.addInstance(FirebaseAuth.instance);
    super.binds(i);
  }
}
