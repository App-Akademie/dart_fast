import 'package:dart_fast/features/authentication/screens/login_screen.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:dart_fast/shared/repositories/mock_database.dart';
import 'package:flutter/material.dart';

void main() {
  final DatabaseRepository repository = MockDatabase();
  runApp(MainApp(repository: repository));
}

/// Features
// - Aufgaben anzeigen lassen + lösen (Quiz)
// - Login (Authentication)
// - Registrierung (Authentication)
// - Übersicht über gelöste Aufgaben (Exerciseboard)
// - Erklärung der App (Onboarding)
// - Einstellungen der App ändern (Settings)

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.repository});

  final DatabaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      repository: repository,
    );
  }
}
