import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/cart/order_status_indicator.dart';
import 'package:b2b_mvp/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final Atom<CartModel?> cartState;

  const CartWidget({super.key, required this.cartState});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.select(() => [cartState]);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const OrderStatusIndicator(),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  'Meu Carrinho',
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  '(${(cartState.value == null) ? 0 : cartState.value!.productList!.length} itens)',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        'Produtos selecionados (${(cartState.value == null) ? 0 : _countProducts()})',
                      ),
                    ),
                  ),
                  Card.filled(
                    child: SizedBox(
                      height: height * .4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemCount: cartState.value!.productList!.length,
                          itemBuilder: (context, index) {
                            ProductModel product =
                                cartState.value!.productList![index];
                            return ProductCard(
                              product: product,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Total: ',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      'R\$ ${(cartState.value == null) ? 0 : _getTotalValue(cartState)}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  labelText: 'CUPOM',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'VALIDATOR CUPOM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  int _countProducts() {
    int count = 0;
    if (cartState.value!.productList != null ||
        cartState.value!.productList!.isNotEmpty) {
      for (final ProductModel(:quantity) in cartState.value!.productList!) {
        count += quantity;
      }
    }
    return count;
  }

  int _getTotalValue(Atom<CartModel?> cartState) {
    int totalValue = 0;
    for (final ProductModel(:quantity, :price) in cartState.value!.productList!) {
      totalValue += price * quantity;
    }
    return totalValue;
  }
}
