import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Function(int) onPressed;
  final ProductModel product;
  final int? index;

  const ProductItem(
      {super.key, required this.onPressed, required this.product, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(index ?? 0);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 175,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.black12, width: 1.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      product.imageUrl,
                      loadingBuilder: (context, widget, imageChunk) {
                        if (imageChunk == null) return widget;
                        return const SizedBox(
                            height: 150,
                            width: 300,
                            child: CircularProgressIndicator());
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const SizedBox(
                            height: 150,
                            width: 300,
                            child: Icon(
                              size: 50,
                              Icons.error_outline,
                              color: Colors.red,
                            ));
                      },
                    ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.name,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'R\$ 1,00/un',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    ),
                    const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'R\$ 12,00',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue),
                      ),
                    ),
                    NumericStepButton(onChanged: (i) {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
