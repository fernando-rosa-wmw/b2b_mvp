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
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    size: 100,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (product.id.isEven)
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
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
                  child: SizedBox(
                    child: AutoSizeText(
                      product.name,
                      textAlign: TextAlign.center,
                      wrapWords: true,
                      maxFontSize: 24,
                      minFontSize: 12,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        product.formattedPrice,
                        minFontSize: 12,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      AutoSizeText(
                        product.formattedPrice,
                        minFontSize: 16,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: IconButton(
                          onPressed: () {
                            onButtonPressed(index!);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
