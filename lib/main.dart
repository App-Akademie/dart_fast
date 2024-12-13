import 'package:dart_fast/features/authentication/screens/login_screen.dart';
import 'package:dart_fast/firebase_options.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:dart_fast/shared/repositories/mock_auth_repository.dart';
import 'package:dart_fast/shared/repositories/mock_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final DatabaseRepository databaseRepository = MockDatabase();
  final AuthRepository authRepository = MockAuthRepository();

  runApp(MainApp(
    databaseRepository: databaseRepository,
    authRepository: authRepository,
  ));
}

/// Features
// - Aufgaben anzeigen lassen + lösen (Quiz)
// - Login (Authentication)
// - Registrierung (Authentication)
// - Übersicht über gelöste Aufgaben (Exerciseboard)
// - Erklärung der App (Onboarding)
// - Einstellungen der App ändern (Settings)

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.databaseRepository,
    required this.authRepository,
  });

  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      databaseRepository: databaseRepository,
      authRepository: authRepository,
    );
  }
}
