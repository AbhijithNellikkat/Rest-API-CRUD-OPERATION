import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/views/users_data_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    // userController.getUsers();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 22, right: 22, top: 55),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextField(
                  controller: userController.nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: userController.emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: userController.phoneNumberController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    await userController.addUser();
                    userController.emailController.clear();
                    userController.nameController.clear();
                    userController.phoneNumberController.clear();
                  },
                  child: const Text("Add User"),
                ),
              ],
            ),
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDataView()));
              },
              child: const Text("Next View")),
          userController.postLoading
              ? const CircularProgressIndicator()
              : const Text("Posted Successfully"),
        ],
      ),
    );
  }
}
