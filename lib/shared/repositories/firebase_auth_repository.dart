import 'dart:developer';

import 'package:dart_fast/shared/models/user_data.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> addUser(String userName, String password) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<void> editUser(UserData user) {
    // TODO: implement editUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserData>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<UserData?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      log(credential.toString());
    } catch (_) {
      return false;
    }

    return Future.value(true);
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<bool> register(String userName, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: userName,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Die Codes sollten eigentlich irgendwie weitergegeben werden, damit
      // der Benutzer weiß, was passiert ist. Oder auf Firebase geloggt werden.
      switch (e.code) {
        case "email-already-in-use":
          log("Firebase Auth Exception: email-already-in-use");
        case "invalid-email":
          log("Firebase Auth Exception: invalid-email");
        case "network-request-failed:":
          log("Firebase Auth Exception: network-request-failed");
      }
      return false;
      // Unexpected Error
    } catch (e) {
      log("Unexpected exception 😨");
      return false;
    }

    return true;
  }
}
