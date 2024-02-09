import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:api_crud_app/app/views/edituser_view.dart';
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
      body: Consumer<UserController>(
        builder: (context, userController, _) {
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              return ListTile(
                onTap: () {
                  userController.editEmailController.text = user.email!;
                  userController.editPhoneNumberController.text =
                      user.phoneNumber!;
                  userController.editNameController.text = user.name!;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditUserView(user: user),
                  ));
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(
                  user.name ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  user.email ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await userController.deleteUser(user.id.toString());
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
