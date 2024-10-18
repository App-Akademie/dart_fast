import 'package:dart_fast/features/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// Features
// - Aufgaben anzeigen lassen + lösen (Quiz)
// - Login (Authentication)
// - Registrierung (Authentication)
// - Übersicht über gelöste Aufgaben (Exerciseboard)
// - Erklärung der App (Onboarding)
// - Einstellungen der App ändern (Settings)

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
