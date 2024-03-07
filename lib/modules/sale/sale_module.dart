import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/data/repositories/hive_product_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleModule extends Module {
  @override
  void binds(Injector i) {
    i.add(SaleController.new);
    i.add<ProductRepository>(HiveProductRepository.new);
    super.binds(i);
  }
}
