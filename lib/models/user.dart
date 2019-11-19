import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  String userId;
  String pseudo;
  String email;

  User({
    this.userId,
    this.pseudo,
    this.email,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) => new User(
        userId: json["userId"],
        pseudo: json["pseudo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "pseudo": pseudo,
        "email": email,
      };

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}