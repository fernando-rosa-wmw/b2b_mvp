import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
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
      child: ListView(
        padding: EdgeInsets.zero,
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
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              // Routefly.navigate(routePaths.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            title: const Text('Perfil'),
            selected: _selectedIndex == 1,
            onTap: () {
              // Routefly.navigate(routePaths.task.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            selected: _selectedIndex == 2,
            onTap: () {
              authController.disconnect();
            },
          ),
        ],
      ),
    );
  }
}
