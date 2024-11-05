import 'dart:math' as math;

import 'package:dart_fast/config/constants.dart';
import 'package:dart_fast/config/sizes.dart';
import 'package:dart_fast/config/themes.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:dart_fast/features/authentication/widgets/df_text_field.dart';
import 'package:dart_fast/main_screen.dart';
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: normalPaddingSize),
                  child: DfTextField(hintText: "USERNAME"),
                ),
                normalVerticalSpacing,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: normalPaddingSize),
                  child: DfTextField(hintText: "PASSWORD"),
                ),
                normalVerticalSpacing,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: normalPaddingSize),
                  child: DfPrimaryButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ));
                      },
                      child: const Text("Login")),
                ),
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
