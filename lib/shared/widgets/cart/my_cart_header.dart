import 'package:flutter/material.dart';

class MyCardHeader extends StatelessWidget {
  const MyCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: AlignmentDirectional.topStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Meu Carrinho',
            style: TextStyle(fontSize: 32),
          ),
          Text(
            '(5 itens)',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
