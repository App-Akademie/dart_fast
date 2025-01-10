import 'package:dart_fast/shared/models/user_data.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  // Der aktuell eingeloggte User. Ist keiner eingeloggt, ist der Wert null.
  UserData? _currentUser;
  // Der Programmierer soll von außen keinen direkten Zugriff haben.
  final List<UserData> _users = [
    UserData(userName: "kai@aa.de", password: "passwort"),
  ];

  /// Alle vorhandenen User zurückgeben.
  @override
  Future<List<UserData>> getAllUsers() {
    return Future.value(_users);
  }

  /// Einen User zur App hinzufügen (registieren) (addUser / createUser)
  /// Jeden User darf es nur einmal geben. Das hier überprüfen und "false"
  /// zurückgeben, falls es den User schon gibt.
  @override
  Future<bool> addUser(String newUserName, String newPassword) {
    // Überprüfen, ob es den User schon gibt.
    for (UserData user in _users) {
      if (newUserName == user.userName) {
        return Future.value(false);
      }
    }
    UserData newUser = UserData(userName: newUserName, password: newPassword);
    _users.add(newUser);

    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  /// Logindaten eines Benutzers überprüfen (checkUserCredentials)
  @override
  Future<bool> login({
    required String userName,
    required String password,
  }) {
    for (UserData currentUser in _users) {
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
  Future<UserData?> getCurrentUser() {
    return Future.delayed(
      const Duration(milliseconds: 1234),
      () => _currentUser,
    );
  }

  /// Die Daten eines Users anpassen (editUser)
  @override
  Future<void> editUser(UserData user) {
    // TODO: implement editUser
    throw UnimplementedError();
  }

  @override
  Future<bool> register(String userName, String password) async {
    // Herausfinden, ob der Benutzer schon existiert.
    // Wenn ja, `false` zurückgeben. Ansonsten anlegen.
    for (final UserData user in _users) {
      if (user.userName.toLowerCase() == userName.toLowerCase()) {
        return false;
      }
    }

    // Neuen Benutzer anlegen
    final UserData newUser = UserData(userName: userName, password: password);
    _users.add(newUser);

    return true;
  }
}
