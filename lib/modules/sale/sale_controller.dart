import 'package:b2b_mvp/shared/data/repositories/hive_product_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/cart_repository.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaleController {
  final HiveProductRepository HproductRepository = Modular.get();
  final CartRepository cartRepository = Modular.get();
  final ProductRepository productRepository = Modular.get();

  void mockList() {
    HproductRepository.mock();
  }

  Future<CartModel> fetchCart() async {
    CartModel cart = await cartRepository.getOne();
    return cart;
  }

  Future<bool> addProductToCart(ProductModel product, CartModel cart) async {
    return await cartRepository.addProduct(product, cart);
  }

  Future<bool> removeProductFromCart(ProductModel product, CartModel cart) async {
    return await cartRepository.removeProduct(product, cart);
  }

  Future<bool> removeAllProductsFromCart(ProductModel product, CartModel cart) async {
    return await cartRepository.removeAllProducts(product, cart);
  }

  Future<ProductModel>  getProduct(int productId) async {
    return await productRepository.getOne(productId);
  }
}
