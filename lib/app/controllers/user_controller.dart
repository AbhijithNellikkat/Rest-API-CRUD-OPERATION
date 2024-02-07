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

  bool postLoading = true;

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

      postLoading = false;
      notifyListeners();

      if (response.statusCode == 201) {
        log("Success : Posted Successfully");
        getUsers();
      }
    } catch (e) {
      postLoading = false;
      notifyListeners();
      log("Error : $e");
    }
  }

  Future<void> getUsers() async {
    Uri url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

    try {
      var response = await http.get(url);
      log("status code : ${response.statusCode}");

      if (response.statusCode == 200) {
        List<UserModel> data = (jsonDecode(response.body) as List)
            .map((item) => UserModel.fromJson(item))
            .toList();

        users.addAll(data);
        log("${users.length}");
        notifyListeners();
      }
    } catch (e) {
      log("Errorr : $e");
      log("${users.length}");
    }
  }
}
