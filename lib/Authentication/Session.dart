import '../DataModel/User.dart';

class Session {
  static final Session _shared = Session._internal();
  User? _authenticatedUser;

  factory Session() {
    return _shared;
  }

  Session._internal();

  User get authenticatedUser {
    if (_authenticatedUser == null) {
      throw Exception("User not authenticated");
    }

    return _authenticatedUser!;
  }

  Future<void> setAuthenticatedUser(User user) async {
    _authenticatedUser = user;
  }

  bool isUserAuthenticated() {
    return _authenticatedUser != null;
  }

  void destroySession() {
    _authenticatedUser = null;
  }
}