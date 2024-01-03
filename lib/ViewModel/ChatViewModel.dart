import 'package:flutter/material.dart';
import 'package:mychatapp/Authentication/AuthDummy.dart';
import 'package:mychatapp/Database/Database.dart';
import 'package:mychatapp/Database/FirebaseDatabase.dart';
import 'package:mychatapp/View/PostPage.dart';
import 'package:mychatapp/View/PostWidget.dart';

import '../Authentication/AuthFirebase.dart';
import '../Authentication/Authentication.dart';
import '../Authentication/Session.dart';
import '../DataModel/Post.dart';
import '../View/LoginPage.dart';

class ChatViewModel extends ChangeNotifier implements PostDeleteDelegate {
  final Authentication _auth = AuthFirebase();
  final Database _database = FirebaseDatabase();
  final BuildContext context;
  final Session session = Session();

  ChatViewModel(this.context);

  Future<void> logout() async {
    await _auth.logout();
    session.destroySession();
  }

  Future<List<Post>> fetchPosts() async {
    return await _database.fetchAll() as List<Post>;
  }

  Future<void> navigateToLoginPage() async {
    _navigateToPages(const LoginPage());
  }

  Future<void> navigateToAddPostPage() async {
    _navigateToPages(const PostPage());
  }

  Future<void> _navigateToPages(Widget widget) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
    );
  }

  @override
  Future<void> deletePost(Post post) async {
    await _database.delete(post);
    notifyListeners();
  }
}