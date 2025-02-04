import 'dart:developer';
import 'dart:math' as math;

import 'package:dart_fast/config/constants.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/logic/email_validator.dart';
import 'package:dart_fast/features/authentication/logic/password_validator.dart';
import 'package:dart_fast/features/authentication/screens/signup_screen.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/main_screen.dart';
import 'package:dart_fast/shared/repositories/auth_repository.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            bigVerticalSpacing,
            Text(
              appTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: Image.asset(
                width: MediaQuery.sizeOf(context).width * .7,
                "assets/images/dart_fast_logo.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: normalPaddingSize,
              ),
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
            smallVerticalSpacing,
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
                validator: passwordValidator,
              ),
            ),
            normalVerticalSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: normalPaddingSize,
              ),
              child: DfPrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    checkLoginAndContinue(
                      userName: usernameController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: normalPaddingSize,
            //   ),
            //   child: DfPrimaryButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const MainScreen(),
            //       ));
            //     },
            //     child: const Text("Skiiiiiiiip"),
            //   ),
            // ),
            bigVerticalSpacing,
            const Text(
              "Forgot Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              )),
              child: Text(
                "Need an account?",
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNext(
      DatabaseRepository repository, AuthRepository authRepository) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  void showLoginUnsuccessfullMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Login failed"),
      ),
    );
  }

  void checkLoginAndContinue({
    required String userName,
    required String password,
  }) async {
    final authRepository = context.read<AuthRepository>();
    final databaseRepository = context.read<DatabaseRepository>();
    bool wasLoginSuccessfull = await authRepository.login(
      userName: userName,
      password: password,
    );

    if (wasLoginSuccessfull) {
      log("Login was successfull :)");
      navigateToNext(databaseRepository, authRepository);
    } else {
      showLoginUnsuccessfullMessage();
    }
  }
}
