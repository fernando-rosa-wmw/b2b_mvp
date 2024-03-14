
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResponsiveGridView extends StatelessWidget {

  const ResponsiveGridView({
    super.key,
    required this.productList,
    required this.onTab,
    this.crossAxisCount,
    this.childAspectRatio,
  });

  final List<ProductModel> productList;
  final Function(int) onTab;
  final int? crossAxisCount;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? (MediaQuery.of(context).size.width ~/ 175).toInt(),
        childAspectRatio: childAspectRatio ??  1 / 1.5,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        ProductModel item = productList[index];
        return ProductItem(
          index: index,
          onButtonPressed: (index) {
            onTab(index);
          },
          onCardPressed: () {
            Modular.to.pushNamed('product_details');
          },
          product: item,
        );
      },
    );
  }
}
