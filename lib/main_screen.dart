import 'dart:developer';

import 'package:dart_fast/config/themes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/authentication/widgets/df_text_field.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.question_mark), label: "Quiz"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
        // Builder needed for different context, so the theme is picked up.
        body: Builder(builder: (context) {
          return const PlayAroundWidget();
        }),
      ),
    );
  }
}

class PlayAroundWidget extends StatelessWidget {
  const PlayAroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'A normal headline',
            style: Theme.of(context).textTheme.headlineMedium,
            //style: TextStyle(fontSize: 42),
          ),
          const SizedBox(height: 16),
          const Text("Default text test"),
          const DfTextField(),
          DfButton(
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
