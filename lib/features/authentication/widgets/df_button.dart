import 'package:flutter/material.dart';

class DfButton extends StatelessWidget {
  const DfButton({super.key, required this.onPressed, required this.child});

  //final void Function() onPressed;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: child);
  }
}
