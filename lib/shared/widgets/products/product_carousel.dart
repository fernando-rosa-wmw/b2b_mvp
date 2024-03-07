import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.carouselController,
    required this.sliderState,
    required int current,
  }) : _current = current;

  final CarouselController carouselController;
  final Atom<int> sliderState;
  final int _current;

  @override
  Widget build(BuildContext context) {
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
                sliderState.value = i;
              }),
          itemBuilder: (context, index, realIndex) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2]
                  .map((e) => ProductItem(
                        onPressed: () {},
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
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
