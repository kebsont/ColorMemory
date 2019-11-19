import 'package:firebase_auth/firebase_auth.dart';
import 'package:colormemory/models/user.dart';
import 'package:colormemory/models/settings.dart';

class StateModel {
  bool isLoading;
  FirebaseUser firebaseUserAuth;
  User user;
  Settings settings;

  StateModel({
    this.isLoading = false,
    this.firebaseUserAuth,
    this.user,
    this.settings,
  });
}