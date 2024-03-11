import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class ProductReducer extends Reducer {
  final ProductRepository productRepository = Modular.get();

  //Atoms
  final productGridState = Atom<List<ProductModel>>([]);
  final productGridLoadingState = Atom(true);
  final sliverState = Atom<int>(0);

  //Actions
  final fetchProduct = Atom.action();
  final sliverOnChange = Atom<int>(0);

  ProductReducer() {
    on(() => [fetchProduct], () async {
      await _fetchProduct();
    });

    on(() => [sliverOnChange], () async {
      await _sliverOnChange();
    });
  }

  _sliverOnChange() {
    sliverState.value = sliverOnChange.value;
  }

  Future<void> _fetchProduct() async {
    productGridState.value = await productRepository.getAll();
    productGridLoadingState.value = false;
    Logger().i('_fetchProduct');
  }
}
