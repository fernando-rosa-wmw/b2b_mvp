import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RxRoot(
      child: MaterialApp.router(
        routerConfig: Modular.routerConfig,
        title: 'B2B',
        themeMode: ThemeMode.system,
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
      ),
    );
  }
}
