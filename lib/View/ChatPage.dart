import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/Authentication/Session.dart';
import 'package:mychatapp/DataModel/User.dart';
import 'package:mychatapp/ViewModel/ChatViewModel.dart';
import '../DataModel/Post.dart';

abstract class PostDeleteDelegate {
  Future<void> deletePost (Post post);
}

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatViewModel _viewModel = ChatViewModel(context);
    final User user = _viewModel.session.authenticatedUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _viewModel.logout();
              await _viewModel.navigateToLoginPage();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Text('ログイン情報：${user.email}'),
          ),
          Expanded(
            //Fetch allを使って、非同期通信を元にViewを変えたい。
            child: FutureBuilder<List<Post>> (
              future: _viewModel.fetchPosts(),
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text('読込中...'),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('エラーが発生しました: ${snapshot.error}'),
                  );
                }

                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ChatWidget(post: snapshot.data![index], delegate: _viewModel,);
                    },
                  );
                }

                return const Center(
                  child: Text('投稿はありません'),
                );
              },
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _viewModel.navigateToAddPostPage();
        },
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  User sessionUser = Session().authenticatedUser;
  PostDeleteDelegate delegate;
  Post post;

  ChatWidget({super.key, required this.post, required this.delegate});

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

class PostWidget extends StatelessWidget {
  User sessionUser = Session().authenticatedUser;
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