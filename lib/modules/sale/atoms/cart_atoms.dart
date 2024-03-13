import 'package:asp/asp.dart';
import '../../../shared/models/cart_model.dart';
import '../../../shared/models/product_model.dart';

//Atoms
final cartState = Atom<CartModel?>(null);
final categoryList = ['Eletronicos', 'Casa', 'Banho'];

//Actions
final addProductToCard = Atom<ProductModel?>(null);
final removeProductFromCard = Atom<ProductModel?>(null);
final removeAllProductsFromCard = Atom<ProductModel?>(null);
final fetchCard = Atom.action();