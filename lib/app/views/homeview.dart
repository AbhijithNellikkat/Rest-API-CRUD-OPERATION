import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/models/user_model.dart';
import 'package:api_crud_app/app/views/users_data_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            margin: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 55),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  maxLength: 10,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                const SizedBox(height: 19),
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
                  child: const Text(" Submit "),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserDataView()),
            );
          },
          label: const Text('All Users')),
    );
  }
}
