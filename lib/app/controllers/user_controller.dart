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

  TextEditingController editNameController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editPhoneNumberController = TextEditingController();

  bool postLoading = true;

  Future<void> addUser(UserModel user) async {
    final url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

    try {
      final response = await http.post(
        url,
        body: jsonEncode(user.toJson()),
        headers: {"content-type": "application/json"},
      );

      if (response.statusCode == 201) {
        log("Success: User added successfully");
        getUsers();
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> getUsers() async {
    Uri url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

    postLoading = true;

    try {
      var response = await http.get(url);
      log("status code : ${response.statusCode}");

      if (response.statusCode == 200) {
        List<UserModel> data = (jsonDecode(response.body) as List)
            .map((item) => UserModel.fromJson(item))
            .toList();

        users.clear();
        users.addAll(data);
        log("${users.length}");
        notifyListeners();
      }
    } catch (e) {
      log("Errorr : $e");
      log("${users.length}");
    } finally {
      postLoading = false;
    }
  }

  // Future<void> getUsers() async {
  //   Uri url = Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users");

  //   try {
  //     var response = await http.get(url);
  //     log("status code : ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       List<UserModel> data = (jsonDecode(response.body) as List)
  //           .map((item) => UserModel.fromJson(item))
  //           .toList();

  //       users.addAll(data);
  //       log("${users.length}");
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     log("Errorr : $e");
  //     log("${users.length}");
  //   }
  // }

  Future<void> deleteUser(String index) async {
    Uri url =
        Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users/$index");

    var response = await http.delete(url);

    if (response.statusCode == 200) {
      users.removeWhere((user) => user.id == index);
      notifyListeners();
      log("User Deleted .......");
    }
  }

  Future<void> updateUser(String userId, UserModel user) async {
    Uri url =
        Uri.parse("https://65c33f3039055e7482c06b43.mockapi.io/users/$userId");

    final updatedData = UserModel(
      id: userId,
      email: editEmailController.text,
      phoneNumber: editPhoneNumberController.text,
      name: editNameController.text,
    );

    try {
      var response = await http.put(
        url,
        body: jsonEncode(updatedData.toJson()),
        headers: {"content-type": "application/json"},
      );

      if (response.statusCode == 200) {
        final index = users.indexWhere((u) => u.id == userId);
        if (index != -1) {
          users[index] = updatedData;
          notifyListeners();
          log("User data updated.....");
        }
      }
    } catch (e) {
      log("$e");
    }
  }

  void clearUsers() {
    users.clear();
    log(" Users length : ${users.length}");
    notifyListeners();
  }
}
