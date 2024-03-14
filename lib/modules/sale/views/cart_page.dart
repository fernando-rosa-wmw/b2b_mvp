import 'package:b2b_mvp/shared/widgets/cart/cart_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: CartWidget(),
      ),
    );
  }
}
