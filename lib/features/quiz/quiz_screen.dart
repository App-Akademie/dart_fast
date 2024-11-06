import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  static const screenTitle = "Quiz";

  const QuizScreen({super.key, required this.repository});

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Container(
            color: Colors.red,
          )),
          Flexible(
              child: Container(
            color: Colors.green,
          )),
          Flexible(
              child: Container(
            color: Colors.blue,
          )),
        ],
      ),
    );
  }
}
