import 'package:flutter/material.dart';
import 'package:provider_et_sqflite/model/counter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<Counter>(
        model: Counter(),
        child: const MyHomePage(),
      ),
    );
  }
}
