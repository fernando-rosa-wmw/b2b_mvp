import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:b2b_mvp/modules/auth/auth_page.dart';
import 'package:b2b_mvp/modules/sale/sale_module.dart';
import 'package:b2b_mvp/shared/interfaces/services/sign_in_service.dart';
import 'package:b2b_mvp/shared/services/google_signin_service.dart';
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

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const AuthPage());
    r.module('/sale', module: SaleModule());
    super.routes(r);
  }
}
