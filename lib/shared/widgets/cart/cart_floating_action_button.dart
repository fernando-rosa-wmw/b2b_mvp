import 'package:b2b_mvp/modules/sale/views/sale_page.dart';
import 'package:flutter/material.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
