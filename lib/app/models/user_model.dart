class UserModel {
  // step 1 : create data types variables
  String? name, phoneNumber, email;
  int? id;

  // step 2 : create a constructor
  UserModel({
    this.email,
    this.id,
    this.name,
    this.phoneNumber,
  });

  // step 3 : create fromJson method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      id: json["id"],
      name: json["name"],
      phoneNumber: json["phoneNumber"],
    );
  }

  // step 4 : create toJson method
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "id": id,
    };
  }
}
