import 'package:asp/asp.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';

//Atoms
final productDetailsState = Atom<ProductModel?>(null);
final productDetailsLoadingState = Atom(true);

final productGridState = Atom<List<ProductModel>>([]);
final productGridLoadingState = Atom(true);

//Actions
final fetchProduct = Atom.action();
final fetchProductDetails = Atom<int>(0);
