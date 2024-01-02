import 'package:cloud_firestore/cloud_firestore.dart';

import '../DataModel/Post.dart';
import 'Database.dart';


class FirebaseDatabase implements Database {
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
  Future<void> post(Entity entity) async {
    Post post = entity as Post;

    await FirebaseFirestore.instance
        .collection('posts')
        .doc()
        .set({
      'text': post.text,
      'email': post.email,
      'date': post.time
    });
  }

}