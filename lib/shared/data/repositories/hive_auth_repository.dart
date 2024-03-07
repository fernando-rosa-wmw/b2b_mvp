import 'package:b2b_mvp/shared/interfaces/repositories/auth_repository.dart';
import 'package:b2b_mvp/shared/models/auth_model.dart';

class HiveAuthRepository implements AuthRepository {

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<AuthModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> insert(AuthModel model) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<AuthModel>> insertAll(List<AuthModel> model) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> update(AuthModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
