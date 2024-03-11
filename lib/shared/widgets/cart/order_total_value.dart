import 'package:flutter/material.dart';

class OrderTotalValue extends StatelessWidget {
  const OrderTotalValue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total: ',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            'R\$ 11,67',
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
