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
  Future<List<Entity>?> fetchAll() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('date')
          .get();

      List<Entity> posts = querySnapshot.docs.map((doc) => Post(
          id: doc.id,
          email: doc['email'],
          text: doc['text'],
          time: doc['date'])
      ).toList();

      return posts;
    } catch (e) {
      print('Error fetching posts: $e');
      return null;
    }
  }

  @override
  Future<void> post(Entity entity) async {
    Post post = entity as Post;

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .set({
      'text': post.text,
      'email': post.email,
      'date': post.time
    });
  }

  @override
  Future<void> delete(Entity entity) async {
    Post post = entity as Post;

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .delete();
  }
}