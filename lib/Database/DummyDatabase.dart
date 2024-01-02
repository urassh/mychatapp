import 'Database.dart';

class DummyDatabase implements Database {
  @override
  Future<Entity?> fetch(String id) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<Entity>?> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }

  @override
  Future<void> post(Entity entity) {
    // TODO: implement post
    throw UnimplementedError();
  }

}