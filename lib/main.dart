import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LoginPage.dart';
import 'firebase_options.dart';
import 'MyAuthPage.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: LoginPage(),
    );
  }
}
