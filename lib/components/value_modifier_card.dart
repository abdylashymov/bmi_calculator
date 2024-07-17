import 'package:flutter/material.dart';

class ValueModifierCard extends StatelessWidget {
  const ValueModifierCard({
    required this.modifierName,
    required this.modifierValue,
    this.onDecrement,
    this.onIncrement,
    super.key,
  });

  final String modifierName;
  final String modifierValue;
  final void Function()? onIncrement;
  final void Function()? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              modifierName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.tertiaryFixed,
              ),
            ),
            Text(
              modifierValue.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(
                  onPressed: onDecrement,
                  icon: const Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton.filled(
                  onPressed: onIncrement,
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
