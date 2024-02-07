// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    DateTime ?  createdAt;
    String ? name;
    String  ? phoneNumber;
    String  ? email;
    String ?  id;

    UserModel({
        this.createdAt,
        this.name,
        this.phoneNumber,
        this.email,
        this.id,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "id": id,
    };
}

