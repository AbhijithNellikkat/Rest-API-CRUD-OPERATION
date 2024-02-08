import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/models/user_model.dart';
import 'package:api_crud_app/app/views/users_data_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            margin: const EdgeInsets.all(22),
            child: Column(
              children: [
                const SizedBox(height: 55),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final newUser = UserModel(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                    );
                    await userController.addUser(newUser);
                    nameController.clear();
                    emailController.clear();
                    phoneNumberController.clear();
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
                MaterialPageRoute(builder: (context) => const UserDataView()),
              );
            },
            child: const Text("Next View"),
          ),
        ],
      ),
    );
  }
}
