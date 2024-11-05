import 'package:dart_fast/config/colors.dart';
import 'package:flutter/material.dart';

class DfPrimaryButton extends StatelessWidget {
  const DfPrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  // final void Function() onPressed;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(darkBlue),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
