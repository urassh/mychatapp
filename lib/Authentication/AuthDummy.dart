import '../DataModel/Account.dart';
import 'Authentication.dart';

class AuthDummy implements Authentication {
  static List<Account> users = [];

  @override
  Future<Account?> login(String email, String password) async {
    Account? user = users.firstWhere((user) => user.email == email);

    if (user == null) {
      return null;
    }

    if (user.password == password) {
      print('ログイン成功: $email');
      return user;
    } else {
      print('ログイン失敗: $email');
      return null;
    }
  }

  @override
  Future<Account?> register(String email, String password) async {
    if (users.any((user) => user.email == email)) {
      print('このメールアドレスは既に登録されています: $email');
      return null;
    }

    Account newUser = Account(email: email, password: password);
    users.add(newUser);
    print('新規ユーザー登録成功: $email');
    return newUser;
  }

  @override
  Future<void> logout() async {
    print('ログアウト成功です');
  }
}

