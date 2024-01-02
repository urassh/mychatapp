import '../DataModel/Account.dart';

class Session {
  static final Session _shared = Session._internal();
  late Account _authenticatedUser;

  factory Session() {
    return _shared;
  }

  Session._internal();

  Account get authenticatedUser {
    if (_authenticatedUser == null) {
      throw Exception("User not authenticated");
    }

    return _authenticatedUser;
  }

  Future<void> setAuthenticatedUser(Account user) async {
    _authenticatedUser = user;
  }

  bool isUserAuthenticated() {
    return _authenticatedUser != null;
  }
}