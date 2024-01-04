import 'package:flutter/material.dart';
import 'package:mychatapp/View/ChatPage.dart';
import 'package:mychatapp/administration.dart';
import '../DataModel/Post.dart';
import '../Database/Database.dart';

class PostViewModel extends ChangeNotifier {
  final Database _database = Services.database;
  final BuildContext context;
  PostViewModel(this.context);

  Future<void> post(Post post) async {
    _database.post(post);
  }

  Future<void> navigateToChatPage() async {
    _navigateToPages(const ChatPage());
  }

  Future<void> _navigateToPages(Widget widget) async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
    );
  }
}