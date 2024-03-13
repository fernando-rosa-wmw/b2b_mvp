import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartReducer extends Reducer {
  SaleController saleController = Modular.get();

  CartReducer() {
    on(() => [addProductToCard], () {
      _addProductToCard();
    });

    on(() => [fetchCard], () {
      _fetchCard();
    });

    on(() => [removeProductFromCard], () {
      _removeProductFromCart();
    });

    on(() => [removeAllProductsFromCard], () {
      _removeAllProductsFromCart();
    });
  }

  void _addProductToCard() async {
    ProductModel product = addProductToCard.value!;
    CartModel cart = cartState.value!;
    await saleController.addProductToCart(product, cart);
    _fetchCard();
  }

  void _removeProductFromCart() async {
    ProductModel product = removeProductFromCard.value!;
    CartModel cart = cartState.value!;
    await saleController.removeProductFromCart(product, cart);
    _fetchCard();
  }

  void _removeAllProductsFromCart() async {
    ProductModel product = removeAllProductsFromCard.value!;
    CartModel cart = cartState.value!;
    await saleController.removeAllProductsFromCart(product, cart);
    _fetchCard();
  }

  void _fetchCard() async {
    CartModel cart = await saleController.fetchCart();
    cartState.value = cart;
  }
}
