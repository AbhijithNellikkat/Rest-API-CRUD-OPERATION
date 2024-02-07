import 'dart:convert';
import 'dart:developer';

import 'package:api_crud_app/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class UserController extends ChangeNotifier {
  var users = <UserModel>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> addUser() async {
    Uri url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

    final userData = UserModel(
      email: emailController.text,
      name: nameController.text,
      phoneNumber: phoneNumberController.text,
    );

    try {
      var response = await http.post(
        url,
        body: jsonEncode(userData.toJson()),
        headers: {"content-type": "application/json"},
      );

      if (response.statusCode == 201) {
        log("Success : Posted Successfully");
        getUser();
      }
    } catch (e) {
      log("Error : $e");
    }
  }

  Future<void> getUser() async {
    Uri url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = List<UserModel>.from(
                jsonDecode(response.body).map((e) => UserModel.fromJson(e)))
            .toList();

        users.add(data as UserModel);
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
