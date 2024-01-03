import '../DataModel/Post.dart';
import 'Database.dart';

class DummyDatabase implements Database {
  final List<Post> _posts = [];

  @override
  Future<Entity?> fetch(String id) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<List<Entity>?> fetchAll() async {
    return _posts;
  }

  @override
  Future<void> post(Entity entity) async {
    _posts.add(entity as Post);
  }

  @override
  Future<void> delete(Entity entity) async {
    if (entity is Post) {
      _posts.remove(entity);
    }
  }
}