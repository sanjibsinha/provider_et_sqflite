import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/model/user_prvider.dart';
import '/model/database_handler.dart';
import '/model/user.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({Key? key}) : super(key: key);

  static const String title = 'Adding By Provider';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final handler = DatabaseHandler();
    Future<int> addUsers() async {
      User secondUser = User(
        name: userProvider.userProvider.name,
        location: userProvider.userProvider.location,
      );
      List<User> listOfUsers = [
        secondUser,
      ];
      return await handler.insertUser(listOfUsers);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
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
          userProvider.addingUsers();
        },
        label: const Text(
          'Add Users by Provider',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
