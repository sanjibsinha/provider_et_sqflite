import 'package:flutter/material.dart';
import 'package:provider_et_sqflite/model/counter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.counter,
  }) : super(key: key);
  final Counter counter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Counter>(
      model: Counter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scoped Model Simple',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        /// child widggets are now under its scope
        /// and we can use this model anywhere below
        ///
        home: const MyHomePage(),
      ),
    );
  }
}
