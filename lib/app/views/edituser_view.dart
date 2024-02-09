import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditUserView extends StatelessWidget {
  EditUserView({super.key, required this.user});

  UserModel user;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
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
                    style: const TextStyle(color: Colors.white),
                    controller: controller.editNameController,
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
                    controller: controller.editEmailController,
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
                    controller: controller.editPhoneNumberController,
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
                      await controller.updateUser(user.id!, user);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    child: const Text(" Update "),
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
