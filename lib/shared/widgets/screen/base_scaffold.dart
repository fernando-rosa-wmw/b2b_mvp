import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/shared/widgets/navbar/nav_bar.dart';
import 'package:b2b_mvp/shared/widgets/platform_resolutions.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function() floatingAction;

  const BaseScaffold({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.floatingAction,
  });

  @override
  Widget build(BuildContext context) {
    context.select(() => [cartState]);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: (width >= PlatformResolutions.phone_width)
          ? buildWebHeader(context)
          : buildAppBar(),
      drawer: BaseDrawer(
        selectedIndex: selectedIndex,
      ),
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
                onPressed: floatingAction,
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

  PreferredSize buildWebHeader(BuildContext context) {
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
                    children: getHeaderItems(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getHeaderItems(BuildContext context) {
    return categoryList
        .map(
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
}
