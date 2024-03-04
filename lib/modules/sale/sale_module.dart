import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleModule extends Module {
  @override
  void binds(Injector i) {
    i.add(SaleController.new);
    super.binds(i);
  }
}
