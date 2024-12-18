import 'package:dart_fast/features/authentication/screens/login_screen.dart';
import 'package:dart_fast/firebase_options.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:dart_fast/shared/repositories/firebase_auth_repository.dart';
import 'package:dart_fast/shared/repositories/firebase_database_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final DatabaseRepository databaseRepository = MockDatabase();
  // final AuthRepository authRepository = FirebaseAuthRepository();

  runApp(MultiProvider(
    // Hier kommen die Repositories rein, die wir später verwenden können wollen.
    providers: [
      Provider<DatabaseRepository>(
        create: (_) => FirestoreDatabaseRepository(),
      ),
      Provider<AuthRepository>(
        create: (_) => FirebaseAuthRepository(),
      ),
    ],
    child: const MainApp(),
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
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
