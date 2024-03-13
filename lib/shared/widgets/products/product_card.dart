import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    child: Image.network(product.imageUrl),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'R\$ ${product.price}',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Quantidade'),
                    NumericStepButton(
                      counter: product.quantity,
                      onAddChanged: () {
                        addProductToCard.setValue(product);
                      },
                      onRemoveChanged: () {
                        removeProductFromCard.setValue(product);
                      },
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subtotal'),
                      Text(
                        'R\$ 4,76',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    removeAllProductsFromCard.setValue(product);
                  },
                  icon: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
