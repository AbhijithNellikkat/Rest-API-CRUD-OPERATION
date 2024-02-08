import 'dart:developer';

import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserView extends StatelessWidget {
  EditUserView({super.key, required this.user});

  UserModel user;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              margin: const EdgeInsets.all(22),
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  TextField(
                    controller: controller.editNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.editEmailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.editPhoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      log("kjhgkjhgk");
                      await controller.updateUser(user);
                    },
                    child: const Text("Update User"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
