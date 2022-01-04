import 'package:flutter/material.dart';

import 'package:provider_et_sqflite/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scoped Model Simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// child widggets are now under its scope
      /// and we can use this model anywhere below
      ///
      home: ScopedModel<UserModel>(
        model: UserModel(),
        child: const ModelHomePage(),
      ),
    );
  }
}
