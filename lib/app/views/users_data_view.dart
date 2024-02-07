import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataView extends StatefulWidget {
  const UserDataView({super.key});

  @override
  State<UserDataView> createState() => _UserDataViewState();
}

class _UserDataViewState extends State<UserDataView> {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    userController.getUsers();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          final user = userController.users[index];
          return ListTile(
            title: Text("${user.name}"),
            subtitle: Text("abhijithnellikkat@gmail.com"),
          );
        },
      ),
    );
  }
}
