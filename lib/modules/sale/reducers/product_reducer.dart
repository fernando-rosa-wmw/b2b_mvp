import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class ProductReducer extends Reducer {
  final ProductRepository productRepository = Modular.get();

  final productGridState = Atom<List<ProductModel>>([]);
  final productGridLoadingState = Atom(true);
  final fetchProduct = Atom.action();

  ProductReducer() {
    on(() => [fetchProduct], () async {
      await _fetchProduct();
    });
  }

  Future<void> _fetchProduct() async {
    productGridState.value = await productRepository.getAll();
    productGridLoadingState.value = false;
    Logger().i('_fetchProduct');
  }
}