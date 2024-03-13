import 'package:auto_size_text/auto_size_text.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Function(int) onButtonPressed;
  final Function onCardPressed;
  final ProductModel product;
  final int? index;
  final double? width;
  final double? height;

  const ProductItem({
    super.key,
    required this.onButtonPressed,
    required this.onCardPressed,
    required this.product,
    this.index,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width ?? 175,
        height: height ?? 360,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
          elevation: 1,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              onCardPressed();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      children: [
                        Card.outlined(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: SizedBox(
                            child: Image.network(
                              width: 250,
                              height: 250,
                              product.imageUrl,
                              loadingBuilder: (context, widget, imageChunk) {
                                if (imageChunk == null) return widget;
                                return const CircularProgressIndicator();
                              },
                              errorBuilder: (context, exception, _) {
                                return const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    color: Colors.red,
                                    size: 200,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (product.id.isEven)
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.percent_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AutoSizeText(
                    product.name,
                    minFontSize: 8,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${product.price}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                        Text(
                          '${product.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            onButtonPressed(index!);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          label: const AutoSizeText(
                            'Adicionar ao Carrinho',
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
