import 'package:flutter/material.dart';

import 'user.dart';

class UserProvider with ChangeNotifier {
  User _userProvider = User(name: 'Json Web', location: 'Detroit');
  User get userProvider => _userProvider;

  void addingUsers() {
    _userProvider = userProvider;

    notifyListeners();
  }
}
