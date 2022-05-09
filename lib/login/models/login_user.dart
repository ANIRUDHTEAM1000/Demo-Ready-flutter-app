// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.status,
    required this.name,
    required this.userLoginId,
    required this.balance,
  });

  int status;
  String name;
  String userLoginId;
  int balance;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        name: json["name"],
        userLoginId: json["user_login_id"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "user_login_id": userLoginId,
        "balance": balance,
      };
}
