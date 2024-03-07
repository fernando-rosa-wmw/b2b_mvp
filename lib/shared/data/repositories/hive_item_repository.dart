import 'package:b2b_mvp/shared/interfaces/repositories/item_repository.dart';
import 'package:b2b_mvp/shared/models/item_model.dart';

class HiveItemRepository implements ItemRepository {
  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<ItemModel> insert(ItemModel model) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> insertAll(List<ItemModel> model) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }

  @override
  Future<ItemModel> update(ItemModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
