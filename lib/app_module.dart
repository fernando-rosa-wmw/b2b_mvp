import 'package:b2b_mvp/modules/auth/auth_module.dart';
import 'package:b2b_mvp/modules/auth/auth_page.dart';
import 'package:b2b_mvp/modules/sale/sale_module.dart';
import 'package:b2b_mvp/modules/sale/views/sale_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        SaleModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const AuthPage());
    r.child('/auth', child: (context) => const AuthPage());
    r.child('/sale', child: (context) => const SalePage());
    super.routes(r);
  }
}
