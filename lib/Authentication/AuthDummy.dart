import 'Authentication.dart';

class AuthDummy implements Authentication {
  // ignore: library_private_types_in_public_api
  static List<_User> users = [];

  @override
  Future<void> login(String email, String password) async {
    var user = users.firstWhere((user) => user.email == email, orElse: () => _User(email: "", password: ""));

    if (user.password == password) {
      print('ログイン成功: $email');
    } else {
      print('ログイン失敗: $email');
    }
  }

  @override
  Future<void> register(String email, String password) async {
    if (users.any((user) => user.email == email)) {
      print('このメールアドレスは既に登録されています: $email');
      return;
    }

    _User newUser = _User(email: email, password: password);
    users.add(newUser);
    print('新規ユーザー登録成功: $email');
  }
}

class _User {
  late String email;
  late String password;

  _User({required this.email, required this.password});
}