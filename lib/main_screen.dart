import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.question_mark), label: "Quiz"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello World!',
                style: TextStyle(fontFamily: "Dongle", fontSize: 42),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  {}
                },
                child: const Text("Press meeee"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
