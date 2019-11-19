import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

Settings settingsFromJson(String str) {
  final jsonData = json.decode(str);
  return Settings.fromJson(jsonData);
}

String settingsToJson(Settings data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Settings {
  String settingsId;
  int score;
  int rang;

  Settings({
    this.settingsId,
    this.score,
    this.rang,
  });

  factory Settings.fromJson(Map<dynamic, dynamic> json) => new Settings(
        settingsId: json["settingsId"],
        score: json["score"],
        rang: json["rang"],
      );

  Map<String, dynamic> toJson() => {
        "settingsId": settingsId,
        "score": score,
        "rang": rang,
      };

  factory Settings.fromDocument(DocumentSnapshot doc) {
    return Settings.fromJson(doc.data);
  }
}