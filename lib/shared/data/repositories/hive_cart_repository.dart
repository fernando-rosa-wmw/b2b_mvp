import 'package:b2b_mvp/shared/interfaces/repositories/cart_repository.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';

class HiveCartRepository implements CartRepository {
  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<CartModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CartModel> insert(CartModel model) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<CartModel>> insertAll(List<CartModel> model) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }

  @override
  Future<CartModel> update(CartModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
