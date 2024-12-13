import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:dart_fast/shared/models/user.dart';

abstract class DatabaseRepository {
  /// Code-Aufgabe erstellen (createProblem)

  /// Code-Aufgabe löschen (deleteProblem)

  /// Alle Code-Aufgaben holen
  Future<List<Exercise>> getAllProblems();

  /// Code-Aufgabe holen (getNextProblem)
  Future<Exercise> getNextProblem();

  /// Prüfung einer Lösung (checkSolution)
  Future<bool> checkSolution(Exercise exercise, String? userSolution);

  /// Holt das Exerciseboard für einen Benutzer
  Future<ExerciseBoard> getExerciseBoardFor(User currentUser);
}
