import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataView extends StatefulWidget {
  const UserDataView({Key? key});

  @override
  State<UserDataView> createState() => _UserDataViewState();
}

class _UserDataViewState extends State<UserDataView> {
  @override
  void initState() {
    super.initState();
    // Clear the list of users when the screen is opened
    Provider.of<UserController>(context, listen: false).clearUsers();
    // Fetch users
    Provider.of<UserController>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserController>(
        builder: (context, userController, _) {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return ListTile(
                leading: const CircleAvatar(),
                title: Text(user.name ?? 'Unknown'),
                subtitle: Text(user.email ?? 'Unknown'),
                trailing: IconButton(
                  onPressed: () async {
                    await userController.deleteUser(user.id.toString());
                  },
                  icon: const Icon(Icons.delete_outlined),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
