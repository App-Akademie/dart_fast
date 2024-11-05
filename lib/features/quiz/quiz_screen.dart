import 'dart:developer';

import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/authentication/widgets/df_text_field.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.repository});

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'A normal headline',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          const Text("Default text test"),
          const DfTextField(hintText: "woof"),
          DfPrimaryButton(
              onPressed: () {
                log("Button was pressed");
              },
              child: const Text("Hi there")),
          OutlinedButton(
            onPressed: () {
              {}
            },
            child: const Text(
              "Press meeee",
            ),
          ),
        ],
      ),
    );
  }
}
