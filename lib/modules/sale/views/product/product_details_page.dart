import 'package:asp/asp.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:b2b_mvp/modules/sale/atoms/sliver_atoms.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_scaffold.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../../../../shared/widgets/cart/cart_widget.dart';
import '../../../../shared/widgets/platform_resolutions.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  ProductModel? product;
  SaleController saleController = Modular.get();

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() async {
    product = await saleController.getProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Logger().i(widget.productId);

    return BaseScaffold(
      body: FutureBuilder(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildProductDetails(width, height),
                        if (width >= PlatformResolutions.phone_width)
                          Expanded(
                            flex: 1,
                            child: buildValueField(width, height),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: width >= PlatformResolutions.phone_width ? width * .75: width,
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
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
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

  Widget buildProductDetails(double width, double height) {
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
                        const AutoSizeText('Inicio > BOMBONIERE >Confeitaria >Leite de Coco'),
                        AutoSizeText(
                          product!.name,
                          minFontSize: 30,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.percent_outlined,
                              color: Colors.blue,
                            ),
                            Text(
                              'Promoção',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const ProductImageCarousel(),
              ],
            ),
          ),
          if (width < PlatformResolutions.phone_width)
            buildValueField(width, height),
        ],
      ),
    );
  }

  Widget buildValueField(double width, double height) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    return Container(
      // color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText('por apenas', minFontSize: 18,),
          AutoSizeText(product!.formattedPrice, minFontSize: 18,style: const TextStyle(color: Colors.grey),),
          AutoSizeText(product!.formattedPrice, minFontSize: 24,),
          SizedBox(
            width: (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            child: DropdownButton(
              value: list.first,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.blue, fontSize: 22),
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
            width: (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            height: (width <= PlatformResolutions.phone_width) ? 60 : height * .09,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    width: (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
                    height: (width <= PlatformResolutions.phone_width) ? 50 : height * .09,
                    child: ElevatedButton.icon(
                      label: const AutoSizeText(
                        'Adicionar',
                        minFontSize: 20,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                        ),
                        backgroundColor: Colors.blue,
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
            width: (width >= PlatformResolutions.phone_width) ? 250 : width * .5,
            child: NumericStepButton(
              onAddChanged: () {},
              onRemoveChanged: () {},
            ),
          )
        ],
      ),
    );
  }
}

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    context.select(() => [productImageSliverState]);
    final CarouselController carouselController = CarouselController();

    return RxBuilder(builder: (context) {
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
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2751/2751070.png'),
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
                                : Colors.blue)
                            .withOpacity(
                                productImageSliverState.value == entry.key
                                    ? 0.9
                                    : 0.4),
                      ),
                      child: const Icon(Icons.image_not_supported_outlined),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    });
  }
}
