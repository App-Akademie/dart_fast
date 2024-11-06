import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/quiz/multiple_choice_widget.dart';
import 'package:dart_fast/shared/models/problem.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const screenTitle = "Quiz";

  const QuizScreen({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentlySelectedAnswerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: smallPaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Frage (Was passiert?)
            Expanded(
              flex: 4,
              child: Text(
                widget.exercise.description,
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
                  widget.exercise.problem,
                  style: const TextStyle(fontFamily: "JetbrainsMono"),
                ),
              ),
            ),
            const Divider(),
            // Antwortmöglichkeiten
            Expanded(
              flex: 3,
              child: MultipleChoiceWidget(
                choices: widget.exercise.choices,
                currentlySelectedIndex: currentlySelectedAnswerIndex,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      currentlySelectedAnswerIndex =
                          widget.exercise.choices.indexOf(value);
                    });
                  }
                },
              ),
            ),
            DfPrimaryButton(
              onPressed: () {},
              child: const Text("Test Answer"),
            ),
          ],
        ),
      ),
    );
  }
}
