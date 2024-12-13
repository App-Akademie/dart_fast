import 'package:dart_fast/shared/models/user_data.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

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
      final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
    } catch (_) {
      return false;
    }

    return Future.value(true);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
