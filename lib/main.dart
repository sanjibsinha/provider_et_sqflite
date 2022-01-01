import 'package:flutter/material.dart';

import 'package:provider_et_sqflite/model/user_model.dart';

import 'view/my_app.dart';

void main() {
  runApp(
    MyApp(user: UserModel()),
  );
}
