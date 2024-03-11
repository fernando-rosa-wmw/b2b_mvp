import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartReducer extends Reducer {
  SaleController saleController = Modular.get();

  //Atoms
  final cartState = Atom<CartModel?>(null);

  //Actions
  final addProductToCard = Atom<ProductModel?>(null);
  final fetchCard = Atom.action();

  CartReducer() {
    on(() => [addProductToCard], () {
      _addProductToCard();
    });

    on(() => [fetchCard], () {
      _fetchCard();
    });
  }

  void _addProductToCard() async {
    ProductModel product = addProductToCard.value!;
    CartModel cart = cartState.value!;
    await saleController.addProductToCart(product, cart);
    _fetchCard();
  }

  void _fetchCard() async {
    CartModel cart = await saleController.fetchCart();
    cartState.value = cart;
  }
}
