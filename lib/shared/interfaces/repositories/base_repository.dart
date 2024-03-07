abstract class BaseRepository<T> {

  Future<List<T>> getAll();

  Future<T> insert(T model);

  Future<List<T>> insertAll(List<T> model);

  Future<T> update(T model);

  Future<bool> delete(int id);
}
