import 'package:scoped_model/scoped_model.dart';

import 'database_handler.dart';
import 'user.dart';

final handler = DatabaseHandler();

class UserModel extends Model {
  User _userOne = User(name: 'XXX', location: 'XXX');
  User get userOne => _userOne;
  /*  User _userTwo = User(name: 'Mutudu', location: 'Hokkaidu');
  User get userTwo => _userTwo; 

  User _userThree = User(name: 'John Smith', location: 'East Coast');
  User get userThree => _userThree;
  */

  void addingUsers() {
    _userOne = userOne;
    //_userTwo = userTwo;
    //_userThree = userThree;

    notifyListeners();
  }
}
