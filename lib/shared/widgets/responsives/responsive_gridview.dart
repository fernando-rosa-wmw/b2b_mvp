
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    super.key,
    required this.productList,
    this.crossAxisCount,
    this.childAspectRatio
  });

  final List<ProductModel> productList;
  final int? crossAxisCount;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? (MediaQuery.of(context).size.width ~/ 175).toInt(),
        childAspectRatio: childAspectRatio ??  1 / 1.8,
      ),
      itemCount: productList.length,
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      itemBuilder: (context, index) {
        ProductModel item = productList[index];
        return ProductItem(
          onPressed: () {},
          name: item.name,
        );
      },
    );
  }
}
