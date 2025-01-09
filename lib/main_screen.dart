import 'package:dart_fast/features/quiz/quiz_screen.dart';
import 'package:dart_fast/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final String _selectedAppBarText = "woof";

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Das muss hier initialisiert werden, weil das Repository davor
    // noch nicht gesetzt ist.
    _screens = [
      const QuizScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_selectedAppBarText)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.question_mark),
            label: "Quiz",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onDestinationSelected: (int newIndex) => setState(() {
          _selectedIndex = newIndex;
        }),
      ),
      // Builder needed for different context, so the theme is picked up.
      body: _screens[_selectedIndex],
    );
  }
}
