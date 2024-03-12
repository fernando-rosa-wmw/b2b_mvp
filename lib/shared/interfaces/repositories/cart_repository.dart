import 'package:b2b_mvp/shared/interfaces/repositories/base_repository.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';

abstract class CartRepository extends BaseRepository<CartModel> {
  Future<bool> addProducts(List<ProductModel> products, CartModel cardModel);
  Future<bool> removeProducts(List<ProductModel> products, CartModel cardModel);
  Future<CartModel> getOne();
}
