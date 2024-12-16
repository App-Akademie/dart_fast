import 'package:dart_fast/features/authentication/screens/login_screen.dart';
import 'package:dart_fast/features/authentication/widgets/df_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const screenTitle = "Settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 128,
          backgroundImage: AssetImage("assets/images/dart_fast_logo.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 64),
          child: DfPrimaryButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
              child: const Icon(Icons.logout)),
        )
      ],
    );
  }
}
