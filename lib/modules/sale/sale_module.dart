import 'package:b2b_mvp/modules/sale/reducers/cart_reducer.dart';
import 'package:b2b_mvp/modules/sale/reducers/product_reducer.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/modules/sale/views/cart_page.dart';
import 'package:b2b_mvp/modules/sale/views/product/product_details_page.dart';
import 'package:b2b_mvp/modules/sale/views/sale_page.dart';
import 'package:b2b_mvp/shared/data/repositories/hive_cart_repository.dart';
import 'package:b2b_mvp/shared/data/repositories/hive_product_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/cart_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class SaleModule extends Module {
  @override
  void binds(Injector i) {
    i.add(SaleController.new);
    i.add<ProductRepository>(HiveProductRepository.new);
    // Remover apenas para mockar
    i.add(HiveProductRepository.new);
    i.add<CartRepository>(HiveCartRepository.new);
    i.addSingleton(ProductReducer.new);
    i.addSingleton(CartReducer.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SalePage());
    r.child('/cart', child: (_) => const CartPage());
    r.child('/product_details/:id', child: (_) => ProductDetailsPage(productId: parseId(r)));
    super.routes(r);
  }

  int parseId(RouteManager r) {
    int id = 0;
    try {
      id = int.tryParse(r.args.params['id'])!;
    } catch (e, s) {
      Logger().e(s);
    }
    return id;
  }
}
