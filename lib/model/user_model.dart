import 'package:scoped_model/scoped_model.dart';

import 'user.dart';

class UserModel extends Model {
  User _userOne = User(name: 'John Smith', location: 'Back East');
  User get userOne => _userOne;

  void addingUsers() {
    _userOne = userOne;

    notifyListeners();
  }
}
