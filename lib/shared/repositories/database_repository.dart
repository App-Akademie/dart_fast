import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user.dart';

abstract class DatabaseRepository {
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

  /// Code-Aufgabe erstellen (createProblem)

  /// Code-Aufgabe löschen (deleteProblem)

  /// Alle Code-Aufgaben holen
  Future<List<Exercise>> getAllProblems();

  /// Code-Aufgabe holen (getNextProblem)
  Future<Exercise> getNextProblem();

  /// Prüfung einer Lösung (checkSolution)
  Future<bool> checkSolution(Exercise exercise, String? userSolution);

  /// Holt das Exerciseboard für einen Benutzer
  Future<ExerciseBoard> getExerciseBoard();
}
