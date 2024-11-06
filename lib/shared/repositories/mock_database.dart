import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Der aktuell eingeloggte User. Ist keiner eingeloggt, ist der Wert null.
  User? _currentUser;
  // Der Programmierer soll von außen keinen direkten Zugriff haben.
  final List<User> _users = [
    User(userName: "kai@aa.de", password: "passwort"),
  ];
  // Enthält ALLE Aufgaben.
  final List<Exercise> _problems = [
    Exercise(
      title: "Simple Addition",
      description: "Welche Ausgabe wird durch den folgenden Code erzeugt?",
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

  /// Code-Aufgabe erstellen (createProblem)

  /// Code-Aufgabe löschen (deleteProblem)

  /// Alle Code-Aufgaben holen
  @override
  Future<List<Exercise>> getAllProblems() {
    return Future.value(_problems);
  }

  /// Code-Aufgabe holen (getNextProblem)
  @override
  Future<Exercise> getNextProblem() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return _problems[_nextUnsolvedExerciseIndex];
      },
    );
  }

  // @override
  // Future<Exercise> getNextProblem() async {
  //   await Future.delayed(const Duration(seconds: 2));

  //   return _problems[_nextUnsolvedExerciseIndex];
  // }

  /// Prüfung einer Lösung (checkSolution)
  @override
  Future<bool> checkSolution(Exercise exercise, String? userSolution) {
    final correctSolution = exercise.choices[exercise.correctSolutionIndex];
    if (correctSolution == userSolution) {
      _nextUnsolvedExerciseIndex++;
      return Future.delayed(const Duration(milliseconds: 500), () => true);
    } else {
      return Future.value(false);
    }
  }

  /// Holt das Exerciseboard für einen User
  @override
  Future<ExerciseBoard> getExerciseBoard() {
    final List<Exercise>? solvedProblems = _solvedProblemsByUsers[_currentUser];
    if (solvedProblems != null) {
      return Future.value(ExerciseBoard(solvedProblems));
    } else {
      return Future.value(ExerciseBoard([]));
    }
  }
}
