import 'package:flutter/material.dart';

import 'all_pages.dart';

class MyApp extends StatelessWidget {
  static const String title = 'Blogs';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: Colors.pink.shade200,
          scaffoldBackgroundColor: Colors.pink.shade600,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const AllPages(),
      );
}
