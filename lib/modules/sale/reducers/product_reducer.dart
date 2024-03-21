import 'package:asp/asp.dart';
import 'package:b2b_mvp/modules/sale/atoms/product_atoms.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../sale_controller.dart';

class ProductReducer extends Reducer {
  final ProductRepository productRepository = Modular.get();
  SaleController saleController = Modular.get();

  ProductReducer() {
    on(() => [fetchProduct], () async {
      _fetchProduct();
    });
    on(() => [fetchProductDetails], () async {
      await _getProduct();
    });
  }

  Future<void> _fetchProduct() async {
    // await Future.delayed(const Duration(seconds: 2));
    productGridState.value = await productRepository.getAll();
    productGridLoadingState.value = false;
  }

  Future<void> _getProduct() async {
    // await Future.delayed(const Duration(seconds: 2));
    int productId = fetchProductDetails.value ?? 0;
    productDetailsState.value = await saleController.getProduct(productId);
    productDetailsLoadingState.value = false;
  }
}
