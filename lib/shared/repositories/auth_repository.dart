import 'package:dart_fast/shared/models/user.dart';

abstract class AuthRepository {
  /// Alle vorhandenen User zurückgeben.
  Future<List<User>> getAllUsers();

  /// Einen User zur App hinzufügen (registieren) (addUser / createUser)
  /// Gibt "false" zurück, wenn es den User schon gibt.
  Future<bool> addUser(String userName, String password);

  /// Die Daten eines Users anpassen (editUser)
  Future<void> editUser(User user);

  /// Benutzer einloggen (login)
  Future<bool> login({
    required String userName,
    required String password,
  });

  Future<void> logout();

  /// Aktuell eingeloggten User zurückgeben.
  /// Falls keiner eingeloggt ist, wird null zurückgegeben.
  Future<User?> getCurrentUser();
}
