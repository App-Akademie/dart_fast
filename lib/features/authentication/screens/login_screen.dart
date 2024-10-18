import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/config/themes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/authentication/widgets/df_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: SafeArea(
        child: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  "App Title",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                normalVerticalSpacing,
                const Placeholder(
                  fallbackWidth: 300,
                  fallbackHeight: 300,
                ),
                normalVerticalSpacing,
                const DfTextField(),
                normalVerticalSpacing,
                const DfTextField(),
                normalVerticalSpacing,
                DfButton(onPressed: () {}, child: const Text("Login")),
                const Text("Forgot Password"),
                const Text("Need an account?"),
              ],
            );
          }),
        ),
      ),
    );
  }
}
