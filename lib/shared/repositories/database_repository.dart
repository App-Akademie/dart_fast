import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user.dart';

abstract class DatabaseRepository {
  /// Alle vorhandenen User zurückgeben.
  List<User> getAllUsers();

  /// Einen User zur App hinzufügen (registieren) (addUser / createUser)
  /// Gibt "false" zurück, wenn es den User schon gibt.
  bool addUser(String userName, String password);

  /// Die Daten eines Users anpassen (editUser)
  void editUser(User user);

  /// Benutzer einloggen (login)
  bool login({
    required String userName,
    required String password,
  });

  void logout();

  /// Aktuell eingeloggten User zurückgeben.
  /// Falls keiner eingeloggt ist, wird null zurückgegeben.
  User? getCurrentUser();

  /// Code-Aufgabe erstellen (createProblem)

  /// Code-Aufgabe löschen (deleteProblem)

  /// Prüfung einer Lösung (checkSolution)
  bool checkSolution(Problem problem, String solution);

  /// Code-Aufgabe holen (getNextProblem)
  Problem getNextProblem();

  /// Alle Code-Aufgaben holen
  List<Problem> getAllProblems();

  /// Holt das Exerciseboard für einen Benutzer
  ExerciseBoard getExerciseBoard();
}
