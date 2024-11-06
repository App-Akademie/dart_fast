import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Der aktuell eingeloggte User. Ist keiner eingeloggt, ist der Wert null.
  User? _currentUser;
  // Der Programmierer soll von außen keinen direkten Zugriff haben.
  final List<User> _users = [User(userName: "kai@aa.de", password: "passwort")];
  // Enthält ALLE Aufgaben.
  final List<Exercise> _problems = [
    Exercise(
      title: "Simple Addition",
      description: "Welche Ausgabe wird durch den folgendne Code erzeugt?",
      problem: "int i = 17;\nint x = 4;\n\nprint(i + x);",
      choices: ["25", "21", "17"],
      correctSolutionIndex: 1,
    ),
    Exercise(
      title: "While Addition",
      description: "Welche Ausgabe wird durch den folgendne Code erzeugt?",
      problem:
          "int i = 0;\nint x = 1;\nwhile i < 5 {\n  i++;\n  x 0 x + 1;\n}\n\nprint(x);",
      choices: ["4", "10", "5"],
      correctSolutionIndex: 2,
    ),
  ];
  // Was ist die nächste Aufgabe, die der Benutzer noch nicht gelöst hat?
  int _nextUnsolvedExerciseIndex = 0;
  // Enthält die Aufgabe, die die jeweiligen User gelöst haben.
  final Map<User, List<Exercise>> _solvedProblemsByUsers = {};

  /// Alle vorhandenen User zurückgeben.
  @override
  List<User> getAllUsers() {
    return _users;
  }

  /// Einen User zur App hinzufügen (registieren) (addUser / createUser)
  /// Jeden User darf es nur einmal geben. Das hier überprüfen und "false"
  /// zurückgeben, falls es den User schon gibt.
  @override
  bool addUser(String newUserName, String newPassword) {
    // Überprüfen, ob es den User schon gibt.
    for (User user in _users) {
      if (newUserName == user.userName) {
        return false;
      }
    }
    User newUser = User(userName: newUserName, password: newPassword);
    _users.add(newUser);

    return true;
  }

  /// Logindaten eines Benutzers überprüfen (checkUserCredentials)
  @override
  bool login({
    required String userName,
    required String password,
  }) {
    for (User currentUser in _users) {
      if (currentUser.userName == userName) {
        if (currentUser.password == password) {
          return true;
        } else {
          return false;
        }
      }
    }

    return false;
  }

  @override
  void logout() {
    _currentUser = null;
  }

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  /// Die Daten eines Users anpassen (editUser)
  @override
  void editUser(User user) {
    // TODO: implement editUser
    throw UnimplementedError();
  }

  /// Code-Aufgabe erstellen (createProblem)

  /// Code-Aufgabe löschen (deleteProblem)

  /// Alle Code-Aufgaben holen
  @override
  List<Exercise> getAllProblems() {
    return _problems;
  }

  /// Code-Aufgabe holen (getNextProblem)
  @override
  Exercise getNextProblem() {
    return _problems[_nextUnsolvedExerciseIndex];
  }

  /// Prüfung einer Lösung (checkSolution)
  @override
  bool checkSolution(Exercise exercise, String? userSolution) {
    final correctSolution = exercise.choices[exercise.correctSolutionIndex];
    if (correctSolution == userSolution) {
      _nextUnsolvedExerciseIndex++;
      return true;
    } else {
      return false;
    }
  }

  /// Holt das Exerciseboard für einen User
  @override
  ExerciseBoard getExerciseBoard() {
    final List<Exercise>? solvedProblems = _solvedProblemsByUsers[_currentUser];
    if (solvedProblems != null) {
      return ExerciseBoard(solvedProblems);
    } else {
      return ExerciseBoard([]);
    }
  }
}
