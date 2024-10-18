import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/authentication/widgets/df_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("App Title"),
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
        ),
      ),
    );
  }
}
