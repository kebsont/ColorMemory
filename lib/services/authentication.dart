import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'package:flutter/services.dart';
import '../models/settings.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class BaseAuth {
  // static Future<String> signUp(String email, String password);

  static Future<FirebaseUser> getCurrentUser() {}

  static Future<void> sendEmailVerification() {}

  static Future<void> signOut() {}

  static Future<bool> isEmailVerified() {}

  static signUp(String email, String password) {}
  static signIn(String email, String password) {}
}

class Auth implements BaseAuth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  static Future<String> signUp(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  static Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return _firebaseAuth.signOut();
  }

  static Future<void> sendEmailVerification() async {
    FirebaseUser user = await getCurrentUser();
    user.sendEmailVerification();
  }

   static bool isEmailVerified()  {
    FirebaseUser user =  Auth.getCurrentUser() as FirebaseUser;
    FirebaseUser user3 =  _firebaseAuth.currentUser() as FirebaseUser;
    FirebaseUser user2 =  Auth.getCurrentFirebaseUser() as FirebaseUser;
    return user3.isEmailVerified;
  }

  static void addUserSettingsDB(User user) async {
    checkUserExist(user.userId).then((value) {
      if (!value) {
        print("user ${user.pseudo} ${user.email} added");
        Firestore.instance
            .document("users/${user.userId}")
            .setData(user.toJson());
        _addSettings(new Settings(
          settingsId: user.userId,
          score: 0,
          rang: 0,
        ));
      } else {
        print("user ${user.pseudo} ${user.email} exists");
      }
    });
  }
  static void addUserSettingsRtDB(User user) async {
    checkUserExist(user.userId).then((value) {
      if (!value) {
        print("user ${user.pseudo} ${user.email} added");
        FirebaseDatabase.instance
            .reference()
            .child("users/${user.userId}")
            .set({
              "email": user.email,
              "pseudo": user.pseudo,
              "userId": user.userId
            });

        _addSettingstoRtDB(new Settings(
          settingsId: user.userId,
          score: 1,
          rang: 0
        ));
      } else {
        print("user ${user.pseudo} ${user.email} exists");
      }
    });
  }

  static void _addSettings(Settings settings) async {
    Firestore.instance
        .document("settings/${settings.settingsId}")
        .setData(settings.toJson());
  }
  static void _addSettingstoRtDB(Settings settings) async {
    FirebaseDatabase.instance
            .reference()
            .child("settings/${settings.settingsId}")
            .set(
              {
                "score": settings.score,
                "rang": settings.rang,
                "settingsId": settings.settingsId
              }
            );
    
  }

  static Future<bool> checkUserExist(String userId) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$userId").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  static Future<User> getUserFirestore(String userId) async {
    if (userId != null) {
      print("getting User Firestore");
      return Firestore.instance
          .collection('users')
          .document(userId)
          .get()
          .then((documentSnapshot) => User.fromDocument(documentSnapshot));
    } else {
      print('firestore userId can not be null');
      return null;
    }
  }

   static Future<User> getUserFirebase(String userId) async {
    if (userId != null) {
      print("getting User Firebase");
      return FirebaseDatabase.instance
      .reference()
          .child('users')
          .child(userId)
          .once()
          .then((DataSnapshot snapshot) => User.fromJson(snapshot.value)
            );
          
          
    } else {
      print('firebase Database userId can not be null');
      return null;
    }
  }

  static Future<Settings> getSettingsFirestore(String settingsId) async {
    if (settingsId != null) {
      return Firestore.instance
          .collection('settings')
          .document(settingsId)
          .get()
          .then((documentSnapshot) => Settings.fromDocument(documentSnapshot));
    } else {
      print('no firestore settings available');
      return null;
    }
  }

   static Future<Settings> getSettingsFirebase(String settingsId) async {
    if (settingsId != null) {
      print("getting Settings Firebase");
      return FirebaseDatabase.instance
      .reference()
          .child('settings')
          .child(settingsId)
          .once()
          .then((DataSnapshot snapshot) => Settings.fromJson(snapshot.value)
             );
    } else {
      print('no firebase settings available');
      return null;
    }
  }

  static Future<String> storeUserLocal(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();   
    String storeUser = userToJson(user);
    await prefs.setString('user', storeUser);
    print("all user data stored locally");
    return user.userId;
  }

  static Future<String> storeSettingsLocal(Settings settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storeSettings = settingsToJson(settings);
    await prefs.setString('settings', storeSettings);
    print("all settings data stored locally");
    return settings.settingsId;
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    return currentUser;
  }

  static Future<User> getUserLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      User user = userFromJson(prefs.getString('user'));
      return user;
    } else {
      return null;
    }
  }

  static Future<Settings> getSettingsLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('settings') != null) {
      Settings settings = settingsFromJson(prefs.getString('settings'));
      return settings;
    } else {
      return null;
    }
  }

  static Future<void> forgotPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static String getExceptionText(Exception e) {
    String error_msg;
    if (e is PlatformException) {
      bool _isIOS;
      if (_isIOS) {
        error_msg = e.details;
      } else
        error_msg = e.message;
      switch (error_msg) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'User with this email address not found.';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Invalid password.';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
          break;
        case 'The email address is already in use by another account.':
          return 'This email address already has an account.';
          break;
        default:
          return 'Unknown error occured.';
      }
    } else {
      return 'Unknown error occured.';
    }
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
