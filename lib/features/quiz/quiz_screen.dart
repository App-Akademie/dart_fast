import 'dart:developer';

import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/quiz/multiple_choice_widget.dart';
import 'package:dart_fast/shared/models/exercise.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  static const screenTitle = "Quiz";

  const QuizScreen({super.key});

  // final Exercise exercise;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentlySelectedAnswerIndex = 0;
  late final Future<Exercise> nextProblemFuture =
      context.read<DatabaseRepository>().getNextProblem();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: smallPaddingSize),
        child: FutureBuilder(
          future: nextProblemFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final Exercise exercise = snapshot.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Frage (Was passiert?)
                  Expanded(
                    flex: 4,
                    child: Text(
                      exercise.description,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const Divider(),
                  // Code
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        exercise.problem,
                        style: const TextStyle(fontFamily: "JetbrainsMono"),
                      ),
                    ),
                  ),
                  const Divider(),
                  // Antwortmöglichkeiten
                  Expanded(
                    flex: 3,
                    child: MultipleChoiceWidget(
                      choices: exercise.choices,
                      currentlySelectedIndex: currentlySelectedAnswerIndex,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            currentlySelectedAnswerIndex =
                                exercise.choices.indexOf(value);
                          });
                        }
                      },
                    ),
                  ),
                  DfPrimaryButton(
                    onPressed: () {},
                    child: Text(
                      "Test Answer",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasError) {
              log("Error! ${snapshot.error}");
              return const Icon(Icons.error, size: 128);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
