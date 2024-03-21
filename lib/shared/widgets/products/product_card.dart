import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/shared/format.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card.outlined(
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
                      child: Image.memory(
                        Uint8List.fromList(product.imageByteArray),
                        errorBuilder: (context, exception, _) {
                          return const SizedBox(
                            width: 250,
                            height: 250,
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.red,
                              size: 100,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AutoSizeText(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        product.formattedPrice,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Subtotal'),
                        Text(formatCurrency(product.price * product.quantity),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
