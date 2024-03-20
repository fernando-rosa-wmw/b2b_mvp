import 'package:asp/asp.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/modules/sale/atoms/product_atoms.dart';
import 'package:b2b_mvp/modules/sale/atoms/sliver_atoms.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_scaffold.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../shared/widgets/cart/cart_widget.dart';
import '../../../../shared/widgets/platform_resolutions.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    productImageSliverState.value = 0;
    productDetailsLoadingState.value = true;
    fetchProductDetails.setValue(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [
          productDetailsLoadingState,
          cartState,
        ]);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final ProductModel? product = productDetailsState.value;

    Logger().i(widget.productId);

    return BaseScaffold(
      body: (productDetailsLoadingState.value || productDetailsState.value == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildProductDetails(width, height, product!),
                        if (width >= PlatformResolutions.phone_width)
                          Expanded(
                            flex: 1,
                            child: buildValueField(width, height, product),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: width >= PlatformResolutions.phone_width
                          ? width * .75
                          : width,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Descrição',
                              minFontSize: 25,
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 10,
                            ),
                            AutoSizeText(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              minFontSize: 20,
                            ),
                            Divider(
                              endIndent: 8,
                              indent: 8,
                            ),
                            AutoSizeText(
                              "Referencia: 78545",
                              minFontSize: 20,
                            ),
                            AutoSizeText(
                              "Marca: DUCOCO",
                              minFontSize: 20,
                            ),
                            AutoSizeText(
                              "Validade minima: 10 dias",
                              minFontSize: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      selectedIndex: 1,
      floatingAction: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return const CartWidget();
          },
        );
      },
    );
  }

  Widget buildProductDetails(double width, double height, ProductModel product) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Container(
            // color: Colors.purple,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                            'Inicio > Categoria > ${product.name}'),
                        AutoSizeText(
                          product.name,
                          minFontSize: 30,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.percent_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              'Promoção',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ProductImageCarousel(product: product),
              ],
            ),
          ),
          if (width < PlatformResolutions.phone_width)
            buildValueField(width, height, product),
        ],
      ),
    );
  }

  Widget buildValueField(double width, double height, ProductModel product) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    return Container(
      // color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'por apenas',
            minFontSize: 18,
          ),
          AutoSizeText(
            product.formattedPrice,
            minFontSize: 18,
            style: const TextStyle(color: Colors.grey),
          ),
          AutoSizeText(
            product.formattedPrice,
            minFontSize: 24,
          ),
          SizedBox(
            width:
                (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            child: DropdownButton(
              value: list.first,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 22),
              onChanged: (String? value) {},
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width:
                (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            height:
                (width <= PlatformResolutions.phone_width) ? 60 : height * .09,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    width: (width >= PlatformResolutions.phone_width)
                        ? 250
                        : width * .5,
                    height: (width <= PlatformResolutions.phone_width)
                        ? 50
                        : height * .09,
                    child: ElevatedButton.icon(
                      label: const AutoSizeText(
                        'Adicionar',
                        minFontSize: 20,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        addProductToCard.setValue(product);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width:
                (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            child: NumericStepButton(
              onAddChanged: () {
                addProductToCard.setValue(product);
              },
              onRemoveChanged: () {
                removeProductFromCard.setValue(product);
              },
              counter: product!.quantity,
            ),
          )
        ],
      ),
    );
  }
}

class ProductImageCarousel extends StatelessWidget {
  final ProductModel product;

  const ProductImageCarousel({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    context.select(() => [productImageSliverState]);
    final CarouselController carouselController = CarouselController();

    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 350.0,
            aspectRatio: 2.0,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (i, reason) {
              productImageSliverState.setValue(i);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Card.outlined(
              child: Image.network(product.imageUrl),
            );
          },
          itemCount: 3,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3].asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary)
                          .withOpacity(
                              productImageSliverState.value == entry.key
                                  ? 0.9
                                  : 0.4),
                    ),
                    child: Opacity(
                      opacity: productImageSliverState.value == entry.key
                          ? 0.9
                          : 0.4,
                      child: Image.network(
                        width: 100,
                        height: 100,
                        product.imageUrl,
                        loadingBuilder: (context, widget, imageChunk) {
                          if (imageChunk == null) return widget;
                          return const CircularProgressIndicator();
                        },
                        errorBuilder: (context, exception, _) {
                          return const SizedBox(
                            width: 100,
                            height: 100,
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
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
