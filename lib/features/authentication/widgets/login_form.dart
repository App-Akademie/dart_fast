import 'dart:developer';
import 'dart:math' as math;

import 'package:dart_fast/config/constants.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/logic/email_validator.dart';
import 'package:dart_fast/features/authentication/logic/password_validator.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/main_screen.dart';
import 'package:dart_fast/shared/repositories/database_repository.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.repository,
  });

  final DatabaseRepository repository;

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
              child: const Text("Login"),
            ),
          ),
          bigVerticalSpacing,
          const Text(
            "Forgot Password?",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          const Text("Need an account?"),
        ],
      ),
    );
  }

  void navigateToNext(DatabaseRepository repository) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainScreen(repository: repository),
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
    bool wasLoginSuccessfull = await widget.repository.login(
      userName: userName,
      password: password,
    );

    if (wasLoginSuccessfull) {
      log("Login was successfull :)");
      navigateToNext(widget.repository);
    } else {
      showLoginUnsuccessfullMessage();
    }
  }
}
