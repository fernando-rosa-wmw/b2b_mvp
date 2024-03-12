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
  }

  void _addProductToCard() async {
    List<ProductModel> products = addProductToCard.value!;
    CartModel cart = cartState.value!;
    await saleController.addProductToCart(products, cart);
    _fetchCard();
  }

  void _removeProductFromCart() async {
    List<ProductModel> products = removeProductFromCard.value!;
    CartModel cart = cartState.value!;
    await saleController.removeProductFromCart(products, cart);
    _fetchCard();
  }

  void _fetchCard() async {
    CartModel cart = await saleController.fetchCart();
    cartState.value = cart;
  }
}
