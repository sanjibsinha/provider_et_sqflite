import 'package:flutter/material.dart';
import 'package:provider_et_sqflite/model/counter.dart';
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoped Model Simple'),
      ),

      /// the child widget below can use the scoped model
      ///
      floatingActionButton: ScopedModelDescendant<Counter>(
        builder: (context, child, model) => FloatingActionButton.extended(
          onPressed: () {
            model.increment();
          },
          label: const Text(
            'Press to Increment',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      /// the child widget below can use the scoped model
      ///
      body: ScopedModelDescendant<Counter>(
        builder: (context, child, model) => Center(
          child: Text(
            model.counter.toString(),
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
