import 'package:flutter/material.dart';

class OrderStatusIndicator extends StatelessWidget {
  final int selectedIndex;

  const OrderStatusIndicator({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Ink(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: selectedIndex == 0 ? Theme.of(context).colorScheme.primary : Colors.grey),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text('Carrinho'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.grey,
              width: 50,
            ),
          ),
          Column(
            children: [
              Ink(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: selectedIndex == 1 ? Theme.of(context).colorScheme.primary : Colors.grey),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.fire_truck,
                    color: Colors.white,
                  ),
                ),
              ),
              Text('Entrega'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.grey,
              width: 50,
            ),
          ),
          Column(
            children: [
              Ink(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: selectedIndex == 2 ? Theme.of(context).colorScheme.primary : Colors.grey),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text('Pagamento')
            ],
          ),
        ],
      ),
    );
  }
}
