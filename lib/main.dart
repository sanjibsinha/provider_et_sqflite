import 'package:flutter/material.dart';
import 'package:provider_et_sqflite/model/counter.dart';

import 'view/my_app.dart';

void main() {
  runApp(
    MyApp(counter: Counter()),
  );
}
