import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user_model.dart';
import 'model/user_prvider.dart';

import 'view/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(
        user: UserModel(),
      ),
    ),
  );
}
