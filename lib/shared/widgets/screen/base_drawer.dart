import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    AuthController authController = Modular.get();
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png"),
                  ),
                ),
                height: 175.0,
              ),
              Container(
                height: 175.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 175.0,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(
                    "Cliente WMW",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: generateTileList(authController),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateTileList(AuthController authController) {
    var list = categoryList;
    return list
      .map(
        (e) => ListTile(
          leading: const Icon(Icons.home_outlined),
          title: Text(e),
          selected: _selectedIndex == list.indexOf(e),
          onTap: () {
            // Routefly.navigate(routePaths.home);
          },
        ),
      ).toList();
  }
}
