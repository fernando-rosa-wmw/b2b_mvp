import 'package:asp/asp.dart';
import '../../../shared/models/cart_model.dart';
import '../../../shared/models/product_model.dart';

//Atoms
final cartState = Atom<CartModel?>(null);

//Actions
final addProductToCard = Atom<List<ProductModel>?>(null);
final removeProductFromCard = Atom<List<ProductModel>?>(null);
final fetchCard = Atom.action();