import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    required this.icon,
    required this.text,
    required this.isActiveColor,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final void Function()? onTap;
  final bool isActiveColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Icon(
                icon,
                color: isActiveColor
                    ? Theme.of(context).colorScheme.primary
                    : null,
                size: 65,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isActiveColor
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
