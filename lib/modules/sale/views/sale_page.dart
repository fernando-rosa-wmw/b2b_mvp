import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/modules/sale/reducers/cart_reducer.dart';
import 'package:b2b_mvp/modules/sale/reducers/product_reducer.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/cart/cart_widget.dart';
import 'package:b2b_mvp/shared/widgets/platform_resolutions.dart';
import 'package:b2b_mvp/shared/widgets/products/product_carousel.dart';
import 'package:b2b_mvp/shared/widgets/responsives/responsive_gridview.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/navbar/nav_bar.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final _selectedIndex = 0;
  final CarouselController productFocusCarouselController =
      CarouselController();
  final SaleController saleController = Modular.get();
  final ProductReducer productReducer = Modular.get();
  final CartReducer cartReducer = Modular.get();

  @override
  void initState() {
    super.initState();
    // TODO - Remover
    saleController.mockList();
    productReducer.fetchProduct();
    fetchCard();
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [
          productReducer.productGridState,
          productReducer.productGridLoadingState,
          cartState,
        ]);
    final List<ProductModel> productList =
        productReducer.productGridState.value;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: (width >= PlatformResolutions.phone_width)
          ? buildWebHeader()
          : buildAppBar(),
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
                  sliderState: productReducer.sliverState,
                  action: productReducer.sliverOnChange,
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
            Stack(
              children: [
                ResponsiveGridView(
                  // childAspectRatio: 1 / 2,
                  onTab: (index) {
                    addProductToCard.setValue([productList[index]]);
                  },
                  productList: productList,
                ),
                if (productReducer.productGridLoadingState.value)
                  const Align(
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  if (width >= PlatformResolutions.phone_width) {
                    Modular.to.navigate('cart');
                  } else {
                    showCartSheet(context, cartState, cartReducer);
                  }
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
            if (cartState.value != null &&
                cartState.value!.productList!.isNotEmpty)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${cartState.value!.productList!.length}'),
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
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Center(
        child: SizedBox(
          width: 70,
          child: Image.network(
              'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png'),
        ),
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
    );
  }

  PreferredSize buildWebHeader() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Image.network(
                        'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png'),
                  ),
                  const Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          label: Text(
                            'Procurar Produtos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: DropdownButton(
                      hint: const Text(
                        'WMW',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Cliente',
                          child: Text(
                            'Cliente',
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Perfil',
                          child: Text(
                            'Perfil',
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Pedidos',
                          child: Text(
                            'Pedidos',
                          ),
                        ),
                      ],
                      onChanged: (o) {},
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'R\$ 0,00',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getHeaderItems(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getHeaderItems() {
    return categoryList.map(
          (e) => InkWell(
            onTap: () {},
            child: Container(
              width: 150,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.black12, width: 1.1),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}

void showCartSheet(BuildContext context, Atom<CartModel?> cartState, CartReducer cartReducer) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return CartWidget(
        cartState: cartState,
      );
    },
  );
}
