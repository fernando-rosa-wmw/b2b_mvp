import 'package:b2b_mvp/modules/auth/auth_module.dart';
import 'package:b2b_mvp/modules/sale/sale_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
    r.module('/auth', module: AuthModule());
    r.module('/sale', module: SaleModule());
    super.routes(r);
  }
}
