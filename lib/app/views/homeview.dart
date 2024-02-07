import 'package:api_crud_app/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserController? provider;

  @override
  void initState() {
    provider = UserController();
    provider!.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            margin: EdgeInsets.only(left: 22, right: 22, top: 55),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextField(
                  controller: provider?.nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: provider?.emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: provider?.phoneNumberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () async {
                      await provider?.addUser();
                    },
                    child: Text("Add User"))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: provider?.users.length,
            itemBuilder: (context, index) {
              final user = provider?.users[index];
              return ListTile(
                title: Text("${user!.name}"),
              );
            },
          )),
        ],
      ),
    );
  }
}
