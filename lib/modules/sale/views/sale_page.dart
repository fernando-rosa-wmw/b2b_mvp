import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/widgets/products/product_carousel.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/navbar/nav_bar.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CarouselController productFocusCarouselController = CarouselController();
    final sliderState = Atom(0);

    return RxBuilder(
      builder: (context) {
        int current = sliderState.value;
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: Center(
              child: SizedBox(
                  width: 70,
                  child: Image.network(
                      'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png')),
            ),
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          drawer: BaseDrawer(
            selectedIndex: _selectedIndex,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  items: [1, 2, 3]
                      .map(
                        (i) => SizedBox(
                          width: width,
                          child: Image.network(
                            color: Colors.blue,
                            'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png',
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      height: height * 0.15,
                      enableInfiniteScroll: false,
                      pageSnapping: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5)),
                ),
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text(
                          'Produtos em Destaque',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                    ProductCarousel(
                      carouselController: productFocusCarouselController,
                      sliderState: sliderState,
                      current: current,
                    )
                  ],
                ),
                const Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text(
                          'Produtos mais comprados',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (MediaQuery.of(context).size.width ~/ 175).toInt(),
                      childAspectRatio: 1 / 1.8,
                    ),
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    itemBuilder: (context, index) {
                      return const ProductItem();
                    }),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 50),
            height: 64,
            width: 64,
            color: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('10'),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: NavBar(
            onTap: (route) {
              Modular.to.navigate(route);
            },
            pageIndex: 0,
          ),
        );
      },
    );
  }
}
