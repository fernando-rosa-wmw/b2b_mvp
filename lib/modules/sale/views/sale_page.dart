import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/widgets/products/product_carousel.dart';
import 'package:b2b_mvp/shared/widgets/products/product_item.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_drawer.dart';
import 'package:b2b_mvp/shared/widgets/utils/NumericStepButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
                      return ProductItem(
                        onPressed: () {},
                      );
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
                    onPressed: () {
                      showCartSheet(context, width, height);
                    },
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

  void showCartSheet(BuildContext context, double width, double height) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const OrderStatusIndicator(),
              const SizedBox(
                height: 40,
              ),
              const MyCardHeader(),
              const Divider(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 32,
                    width: width,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            'Produtos selecionado (2)'),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: SizedBox(
                      height: height * .5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return const ProductCard();
                            }),
                      ),
                    ),
                  ),
                  const OrderTotalValue(),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CUPOM',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder()),
                      onPressed: () {},
                      child: const Text('VALIDATOR CUPOM'),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class OrderTotalValue extends StatelessWidget {
  const OrderTotalValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total: ',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            'R\$ 11,67',
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    child: Image.network(
                        color: Colors.blue,
                        'https://cdn-icons-png.flaticon.com/512/2751/2751071.png'),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Copo Gelado Coca-Cola',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'R\$ 4,76',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Quantidade'),
                    NumericStepButton(
                      onChanged: (int) {},
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subtotal'),
                      Text(
                        'R\$ 4,76',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCardHeader extends StatelessWidget {
  const MyCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Meu Carrinho',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            '(5 itens)',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class OrderStatusIndicator extends StatelessWidget {
  const OrderStatusIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Ink(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text('Carrinho'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.grey,
              width: 50,
            ),
          ),
          Column(
            children: [
              Ink(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.fire_truck,
                    color: Colors.white,
                  ),
                ),
              ),
              Text('Entrega'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.grey,
              width: 50,
            ),
          ),
          Column(
            children: [
              Ink(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  ),
                ),
              ),
              Text('Pagamento')
            ],
          ),
        ],
      ),
    );
  }
}
