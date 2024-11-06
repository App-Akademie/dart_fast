import 'package:flutter/material.dart';

class MultipleChoiceWidget extends StatelessWidget {
  const MultipleChoiceWidget({
    super.key,
    required this.choices,
    required this.currentlySelectedIndex,
    required this.onChanged,
  });

  final List<String> choices;
  final int currentlySelectedIndex;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: choices.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Radio<String>(
              value: choices[index],
              groupValue: choices[currentlySelectedIndex],
              onChanged: (String? value) {
                onChanged(value);
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                choices[index],
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
