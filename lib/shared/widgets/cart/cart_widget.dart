import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/cart_atoms.dart';
import 'package:b2b_mvp/shared/format.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/widgets/cart/order_status_indicator.dart';
import 'package:b2b_mvp/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.select(() => [cartState, cartStatusState]);

    return SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OrderStatusIndicator(selectedIndex: cartStatusState.value),
            switch (cartStatusState.value) {
              0 => buildCardDetails(height, width),
              1 => buildDeliveryDetails(height, width),
              2 => buildPaymentDetails(height, width),
              int() => const Icon(Icons.error_outline_outlined),
            }
          ],
        ),
      ),
    );
  }

  Column buildCardDetails(double height, double width) {
    return Column(
      children: [
        buildHeader('MeuCarrinho'),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildCard(
              height,
              'Produtos selecionados (${(cartState.value == null) ? 0 : _countProducts()})',
              ListView.builder(
                shrinkWrap: true,
                itemCount: (cartState.value != null)
                    ? cartState.value!.productList!.length
                    : 0,
                itemBuilder: (context, index) {
                  ProductModel product = cartState.value!.productList![index];
                  return ProductCard(
                    product: product,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    formatCurrency((cartState.value == null)
                        ? 0
                        : _getTotalValue(cartState)),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  ),
                ),
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
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'VALIDATOR CUPOM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  cartStatusState.value++;
                },
                child: const Text(
                  'ENTREGA',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildCard(double height, String title, Widget content) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              title,
            ),
          ),
        ),
        Card.filled(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(String title) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 32),
              ),
              Text(
                '(${(cartState.value == null) ? 0 : cartState.value!.productList!.length} itens)',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget buildDeliveryDetails(double height, double width) {
    return SizedBox(
      child: Column(
        children: [
          buildHeader('Entrega'),
          buildCard(
            width,
            'Endereço de entrega (1)',
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card.outlined(
                  elevation: 1,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ENDEREÇO SC SANTA CATARINA - 358 - SUL ${index + 1}',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          buildCard(
            width,
            'Data de entrega (1)',
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card.outlined(
                  elevation: 1,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A retirar - Frete não disponivel ${index + 1}',
                          ),
                          Text(
                            'Valor minimo R\$ 56,00 ${index + 1}',
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
                'Algumas datas podem estar bloqueadas pois coincidem com as restrições de entrega informadas por você no seu cadastro.'),
          ),
          const Divider(),
          buildCard(
            height,
            'Observações de entrega',
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              minLines: 6,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Frete: R\$ 0,00'),
                  Text(
                    'Total: R\$ 0,00',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          cartStatusState.setValue(0);
                        },
                        child: const Text(
                          'MEU CARRINHO',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          cartStatusState.setValue(2);
                        },
                        child: const Text(
                          'PAGAMENTO',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildPaymentDetails(double height, double width) {
    return Column(
      children: [
        buildHeader('Pagamento'),
        const Divider(),
      ],
    );
  }

  int _countProducts() {
    int count = 0;
    if (cartState.value!.productList != null ||
        cartState.value!.productList!.isNotEmpty) {
      for (final ProductModel(:quantity) in cartState.value!.productList!) {
        count += quantity;
      }
    }
    return count;
  }

  int _getTotalValue(Atom<CartModel?> cartState) {
    int totalValue = 0;
    for (final ProductModel(:quantity, :price)
        in cartState.value!.productList!) {
      totalValue += price * quantity;
    }
    return totalValue;
  }
}
