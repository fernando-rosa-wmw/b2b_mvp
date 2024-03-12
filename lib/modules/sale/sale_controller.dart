import 'package:b2b_mvp/shared/data/repositories/hive_product_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/cart_repository.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleController {
  final HiveProductRepository HproductRepository = Modular.get();
  final CartRepository cartRepository = Modular.get();

  void mockList() {
    HproductRepository.mock();
  }

  Future<CartModel> fetchCart() async {
    CartModel cart = await cartRepository.getOne();
    return cart;
  }

  Future<bool> addProductToCart(List<ProductModel> products, CartModel cart) async {
    return await cartRepository.addProducts(products, cart);
  }

  Future<bool> removeProductFromCart(List<ProductModel> products, CartModel cart) async {
    return await cartRepository.removeProducts(products, cart);
  }
}
