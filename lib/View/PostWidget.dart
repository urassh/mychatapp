import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/DataModel/Post.dart';
import '../Authentication/Session.dart';
import '../DataModel/Account.dart';

abstract class PostDeleteDelegate {
  Future<void> deletePost (Post post);
}

class PostWidget extends StatelessWidget {
  Account sessionUser = Session().authenticatedUser;
  PostDeleteDelegate delegate;
  Post post;

  PostWidget({super.key, required this.post, required this.delegate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.text),
        subtitle: Text(post.email),
        trailing: post.email == sessionUser.email
            ? IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            delegate.deletePost(post);
          },
        ) : null,
      ),
    );
  }
}