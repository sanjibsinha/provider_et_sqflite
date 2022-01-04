import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '/model/user_model.dart';

import '/model/database_handler.dart';
import '/model/user.dart';
import 'provider_home_page.dart';

class ModelHomePage extends StatelessWidget {
  const ModelHomePage({Key? key}) : super(key: key);

  static const String title = 'Adding by Scoped Model';

  @override
  Widget build(BuildContext context) {
    final userModel = ScopedModel.of<UserModel>(context);

    final handler = DatabaseHandler();
    Future<int> addUsers() async {
      User firstUser = User(
        name: userModel.userModel.name,
        location: userModel.userModel.location,
      );

      List<User> listOfUsers = [
        firstUser,
      ];
      return await handler.insertUser(listOfUsers);
    }

    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) => Scaffold(
        appBar: customAppBar(title),
        body: FutureBuilder(
          future: handler.retrieveUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          key: ValueKey<int>(snapshot.data![index].id!),
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Text(
                            snapshot.data![index].name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data![index].location,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        elevation: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProviderHomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Next Page, Add by Provider',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            handler.initializeDB().whenComplete(() async {
              await addUsers();
            });
            userModel.addingUsers();
          },
          label: const Text(
            'Add Users by Model',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
      elevation: 20,
      titleSpacing: 80,
      title: Text(
        title,
        textAlign: TextAlign.left,
      ),
    );
  }
}
