import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user_data.dart';

import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
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
  final Map<UserData, List<Exercise>> _solvedProblemsByUsers = {};

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
  Future<ExerciseBoard> getExerciseBoardFor(UserData currentUser) {
    final List<Exercise>? solvedProblems = _solvedProblemsByUsers[currentUser];
    if (solvedProblems != null) {
      return Future.value(ExerciseBoard(solvedProblems));
    } else {
      return Future.value(ExerciseBoard([]));
    }
  }
}
