import 'package:b2b_mvp/shared/widgets/cart/my_cart_header.dart';
import 'package:b2b_mvp/shared/widgets/cart/order_status_indicator.dart';
import 'package:b2b_mvp/shared/widgets/cart/order_total_value.dart';
import 'package:b2b_mvp/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
  }
}
