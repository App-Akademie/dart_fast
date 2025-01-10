import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_fast/features/exercise_board/exercise_board.dart';
import 'package:dart_fast/shared/models/exercise.dart';
import 'package:dart_fast/shared/models/user_data.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabaseRepository implements DatabaseRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<bool> checkSolution(Exercise exercise, String? userSolution) {
    // TODO: implement checkSolution
    throw UnimplementedError();
  }

  @override
  Future<List<Exercise>> getAllProblems() async {
    final List<Exercise> exercises = <Exercise>[];

    final User? user = _auth.currentUser;
    if (user == null) return [];

    final QuerySnapshot<Map<String, dynamic>> docs =
        await _db.collection("exercises").get();
    for (final doc in docs.docs) {
      final Map<String, dynamic> data = doc.data();

      final newExercise = Exercise(
        title: data["title"] as String,
        description: data["description"] as String,
        // "\" gets replaced by "\\" when coming from Firestore. Replace back :)
        problem: (data["problem"] as String).replaceAll("\\n", "\n"),
        choices: List<String>.from(data["choices"]),
        correctSolutionIndex: data["correctSolutionIndex"] as int,
      );
      exercises.add(newExercise);
    }

    return exercises;
  }

  // @override
  // Future<List<Exercise>> getAllProblemsUnfiltered() async {
  //   final List<Exercise> exercises = <Exercise>[];
  //   final QuerySnapshot<Map<String, dynamic>> docs =
  //       await _db.collection("exercises").get();
  //   for (final doc in docs.docs) {
  //     final Map<String, dynamic> data = doc.data();

  //     final newExercise = Exercise(
  //       title: data["title"] as String,
  //       description: data["description"] as String,
  //       // "\" gets replaced by "\\" when coming from Firestore. Replace back :)
  //       problem: (data["problem"] as String).replaceAll("\\n", "\n"),
  //       choices: List<String>.from(data["choices"]),
  //       correctSolutionIndex: data["correctSolutionIndex"] as int,
  //     );
  //     exercises.add(newExercise);
  //   }

  //   return exercises;
  // }

  @override
  Future<ExerciseBoard> getExerciseBoardFor(UserData currentUser) {
    // TODO: implement getExerciseBoardFor
    throw UnimplementedError();
  }

  @override
  Future<Exercise> getNextProblem() async {
    return Future.value((await getAllProblems()).first);
  }
}
