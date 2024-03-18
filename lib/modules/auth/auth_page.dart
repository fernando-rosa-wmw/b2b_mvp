import 'package:b2b_mvp/modules/auth/auth_controller.dart';
import 'package:b2b_mvp/shared/widgets/platform_resolutions.dart';
import 'package:b2b_mvp/shared/widgets/screen/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:icons_plus/icons_plus.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Modular.get();

    return BaseScaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                // color: Colors.purple,
                width: MediaQuery.of(context).size.width > PlatformResolutions.phone_width ? 450 : MediaQuery.of(context).size.width,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                        color: Colors.blue,
                        'https://cdn.shortpixel.ai/spai/w_156+q_lossy+ret_img+to_webp/www.wmw.com.br/wp-content/uploads/2019/05/logotipo-2019-branco.png'),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                    const Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: authController.googleSignIn,
                          icon: const Icon(Bootstrap.google, color: Colors.red,),
                        ),IconButton(
                          onPressed: authController.googleSignIn,
                          icon: const Icon(Bootstrap.facebook, color: Colors.blue,),
                        ),IconButton(
                          onPressed: authController.googleSignIn,
                          icon: const Icon(Bootstrap.github, color: Colors.black,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        selectedIndex: 0,
        floatingAction: () {});
  }
}
