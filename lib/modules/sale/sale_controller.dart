import 'package:b2b_mvp/shared/data/repositories/hive_product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleController {
  final HiveProductRepository HproductRepository = Modular.get();

  void mockList() {
    HproductRepository.mock();
  }
}
