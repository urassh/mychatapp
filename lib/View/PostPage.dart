import 'package:flutter/material.dart';
import 'package:mychatapp/ViewModel/PostViewModel.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostViewModel viewModel = PostViewModel(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット投稿'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('戻る'),
          onPressed: () {
            viewModel.navigateToChatPage();
          },
        ),
      ),
    );
  }
}