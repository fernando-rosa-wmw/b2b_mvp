import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/modules/sale/atoms/product_atoms.dart';
import 'package:b2b_mvp/modules/sale/reducers/cart_reducer.dart';
import 'package:b2b_mvp/modules/sale/sale_controller.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/cart/cart_widget.dart';
import 'package:b2b_mvp/shared/widgets/platform_resolutions.dart';
import 'package:b2b_mvp/shared/widgets/products/product_carousel.dart';
import 'package:b2b_mvp/shared/widgets/responsives/responsive_gridview.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final _selectedIndex = 0;
  final CarouselController productFocusCarouselController = CarouselController();
  final SaleController saleController = Modular.get();
  final CartReducer cartReducer = Modular.get();

  @override
  void initState() {
    // TODO - Remover
    saleController.mockList();
    fetchProduct();
    fetchCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [
          productGridState,
          productGridLoadingState,
          cartState,
        ]);
    final List<ProductModel> productList = productGridState.value;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [1, 2, 3]
                  .map(
                    (i) => SizedBox(
                      width: width,
                      child: Image.network(
                        color: Theme.of(context).colorScheme.primary,
                        'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png',
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  height: height * 0.15,
                  pageSnapping: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5)),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Produtos em Destaque',
                      style: TextStyle(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
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
                )
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Produtos mais comprados',
                      style: TextStyle(
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
              ],
            ),
            Stack(
              children: [
                ResponsiveGridView(
                  onTab: (index) {
                    addProductToCard.setValue(productList[index]);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Produto Adicionado!"),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: "Desfazer",
                          onPressed: () {
                            removeProductFromCard.setValue(productList[index]);
                          },
                        ),
                      ),
                    );
                  },
                  productList: productList,
                  crossAxisCount: (width > 1000) ? 6 : null,
                ),
                if (productGridLoadingState.value)
                  const Center(
                    child: LinearProgressIndicator(),
                  ),
              ],
            ),
          ],
        ),
      ),
      selectedIndex: _selectedIndex,
      floatingAction: () {
        if (width >= PlatformResolutions.phone_width) {
          Modular.to.navigate('cart');
        } else {
          showCartSheet(context);
        }
      },
    );
  }

  void showCartSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const CartWidget();
      },
    );
  }
}
