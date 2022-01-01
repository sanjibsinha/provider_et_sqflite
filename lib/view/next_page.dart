import 'package:flutter/material.dart';
import 'package:provider_et_sqflite/model/counter.dart';
import 'package:scoped_model/scoped_model.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  static const String title = 'Next Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),

      /// the child widget below can use the scoped model
      ///
      floatingActionButton: ScopedModelDescendant<Counter>(
        builder: (context, child, model) => FloatingActionButton.extended(
          onPressed: () {
            model.decrement();
          },
          label: const Text(
            'Press to Decrement',
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
          builder: (context, child, model) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Number lowered to ...',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Center(
                    child: Text(
                      model.counter.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )),
    );
  }

  AppBar customAppBar(String title) {
    return AppBar(
      centerTitle: true,
      //backgroundColor: Colors.grey[400],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.grey,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      //elevation: 20,
      titleSpacing: 80,
      leading: const Icon(Icons.menu),
      title: Text(
        title,
        textAlign: TextAlign.left,
      ),
      actions: [
        ScopedModelDescendant<Counter>(
          builder: (context, child, model) => Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              model.counter.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        buildIcons(
          const Icon(
            Icons.navigate_next,
          ),
        ),
        buildIcons(
          const Icon(Icons.search),
        ),
      ],
    );
  }

  IconButton buildIcons(Icon icon) {
    return IconButton(
      onPressed: () {},
      icon: icon,
    );
  }
}
