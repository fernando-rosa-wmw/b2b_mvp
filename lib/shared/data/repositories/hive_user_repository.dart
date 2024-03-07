import 'package:b2b_mvp/shared/interfaces/repositories/user_repository.dart';
import 'package:b2b_mvp/shared/models/user_model.dart';

class HiveUserRepository implements UserRepository {
  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<UserModel> insert(UserModel model) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> insertAll(List<UserModel> model) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }

  @override
  Future<UserModel> update(UserModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
