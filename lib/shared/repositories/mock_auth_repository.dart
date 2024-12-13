import 'package:dart_fast/shared/models/user.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  // Der aktuell eingeloggte User. Ist keiner eingeloggt, ist der Wert null.
  User? _currentUser;
  // Der Programmierer soll von außen keinen direkten Zugriff haben.
  final List<User> _users = [
    User(userName: "kai@aa.de", password: "passwort"),
  ];

  /// Alle vorhandenen User zurückgeben.
  @override
  Future<List<User>> getAllUsers() {
    return Future.value(_users);
  }

  /// Einen User zur App hinzufügen (registieren) (addUser / createUser)
  /// Jeden User darf es nur einmal geben. Das hier überprüfen und "false"
  /// zurückgeben, falls es den User schon gibt.
  @override
  Future<bool> addUser(String newUserName, String newPassword) {
    // Überprüfen, ob es den User schon gibt.
    for (User user in _users) {
      if (newUserName == user.userName) {
        return Future.value(false);
      }
    }
    User newUser = User(userName: newUserName, password: newPassword);
    _users.add(newUser);

    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  /// Logindaten eines Benutzers überprüfen (checkUserCredentials)
  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) {
    for (User currentUser in _users) {
      if (currentUser.userName == userName) {
        if (currentUser.password == password) {
          _currentUser = currentUser;

          return Future.value(true);
        } else {
          return Future.value(false);
        }
      }
    }

    return Future.value(false);
  }

  @override
  Future<void> logout() {
    _currentUser = null;

    return Future.value();
  }

  @override
  Future<User?> getCurrentUser() {
    return Future.delayed(
      const Duration(milliseconds: 1234),
      () => _currentUser,
    );
  }

  /// Die Daten eines Users anpassen (editUser)
  @override
  Future<void> editUser(User user) {
    // TODO: implement editUser
    throw UnimplementedError();
  }
}
