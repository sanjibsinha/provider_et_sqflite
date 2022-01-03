import 'package:flutter/material.dart';

import 'user.dart';

class UserProvider with ChangeNotifier {
  User _userTwo = User(name: 'Json Web', location: 'Detroit');
  User get userTwo => _userTwo;

  void addingUsers() {
    _userTwo = userTwo;

    notifyListeners();
  }
}
