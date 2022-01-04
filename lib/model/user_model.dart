import 'package:scoped_model/scoped_model.dart';

import 'user.dart';

class UserModel extends Model {
  User _userModel = User(name: 'John Smith', location: 'Back East');
  User get userModel => _userModel;

  void addingUsers() {
    _userModel = userModel;

    notifyListeners();
  }
}
