import 'dart:math' as math;

import 'package:dart_fast/config/constants.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/logic/email_validator.dart';
import 'package:dart_fast/features/authentication/logic/matching_password_validator.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/main_screen.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatedPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            normalVerticalSpacing,
            Text(
              appTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: Image.asset(
                width: MediaQuery.sizeOf(context).width * .3,
                "assets/images/dart_fast_logo.png",
              ),
            ),
            bigVerticalSpacing,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: normalPaddingSize),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "USERNAME",
                ),
                autocorrect: false,
                validator: emailValidator,
              ),
            ),
            normalVerticalSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: normalPaddingSize,
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "PASSWORD",
                ),
                autocorrect: false,
                obscureText: true,
                validator: (String? value) {
                  return matchingPasswordValidator(
                    passwordController.text,
                    repeatedPasswordController.text,
                  );
                },
              ),
            ),
            normalVerticalSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: normalPaddingSize,
              ),
              child: TextFormField(
                controller: repeatedPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "REPEAT PASSWORD",
                ),
                autocorrect: false,
                obscureText: true,
                validator: (String? value) {
                  return matchingPasswordValidator(
                    passwordController.text,
                    repeatedPasswordController.text,
                  );
                },
              ),
            ),
            bigVerticalSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: normalPaddingSize,
              ),
              child: DfPrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkRegisterAndContinue(
                      userName: usernameController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Versucht, einen neuen Benutzer zu registrieren.

  void checkRegisterAndContinue({
    required String userName,
    required String password,
  }) async {
    // Logik sollte vermutlich im AuthRepository gemacht werden:
    // Schauen, ob der Benutzername noch frei ist.
    // Schauen, ob die Passwörter übereinstimmen.
    // -> Muss da auch was als Validierungsmeldung gesetzt werden?
    // -> Wird über den entsprechenden Validator gemacht.
    final authRepository = context.read<AuthRepository>();
    final bool registerSuccess = authRepository.register(userName, password);
    if (!registerSuccess) {
      showUsernameAlreadyTakenMessage();
    } else {
      // Einloggen und weitergehen auf Exercise-Screen.
      await authRepository.login(userName: userName, password: password);
      continueToMainScreen();
    }
  }

  void showUsernameAlreadyTakenMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Username already taken."),
      ),
    );
  }

  void continueToMainScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }
}
