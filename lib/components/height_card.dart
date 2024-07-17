import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({
    required this.value,
    this.onChanged,
    super.key,
  });

  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'HEIGHT',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.tertiaryFixed,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${value.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'cm',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      height: 2.1,
                      color: Theme.of(context).colorScheme.tertiaryFixed,
                    ),
                  ),
                ],
              ),
              Slider.adaptive(
                min: 50,
                value: value,
                max: 270,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
