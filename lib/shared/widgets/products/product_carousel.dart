import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.carouselController,
    required this.sliderState,
    required this.action,
  });

  final CarouselController carouselController;
  final Atom<int> sliderState;
  final Atom<int> action;

  @override
  Widget build(BuildContext context) {
    context.select(() => [sliderState]);

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
                action.setValue(i);
              }),
          itemBuilder: (context, index, realIndex) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2]
                  .map((e) =>
                  ProductItem(
                        width: 225,
                        product: ProductModel(
                          description: 'Banner',
                          id: 0,
                          imageUrl: '',
                          name: 'Tridendete muiot bom duas linhas',
                          price: 0,
                          quantity: 0,
                        ),
                        onPressed: (index) {},
                      ))
                  .toList(),
            );
          },
          itemCount: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.blue)
                        .withOpacity(
                            sliderState.value == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
