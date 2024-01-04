abstract class Entity {}

abstract class Database<T extends Entity> {
  Future<List<T>?> fetchAll() async {
    return [];
  }

  Future<T?> fetch(String id) async {

  }

  Future<void> post(T entity) async {

  }

  Future<void> delete(T entity) async {

  }
}