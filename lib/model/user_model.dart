import 'package:scoped_model/scoped_model.dart';

import 'database_handler.dart';
import 'user.dart';

final handler = DatabaseHandler();

class UserModel extends Model {
  User _userOne = User(name: 'Json Web', location: 'Detroit');
  User get userOne => _userOne;

  void addingUsers() {
    _userOne = userOne;

    notifyListeners();
  }
}
