import 'dart:developer';

import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/height_card.dart';
import 'package:bmi_calculator/components/value_modifier_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int height = 175;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    icon: Icons.male,
                    isActiveColor: isMale,
                    text: 'MALE',
                    onTap: () {
                      isMale = true;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GenderCard(
                    icon: Icons.female,
                    isActiveColor: !isMale,
                    text: 'FEMALE',
                    onTap: () {
                      isMale = false;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          HeightCard(
            value: height.toDouble(),
            onChanged: (v) {
              height = v.toInt();
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ValueModifierCard(
                    modifierName: 'WEIGHT',
                    modifierValue: weight.toString(),
                    onDecrement: () {
                      weight--;
                      setState(() {});
                    },
                    onIncrement: () {
                      weight++;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ValueModifierCard(
                    modifierName: 'AGE',
                    modifierValue: age.toString(),
                    onDecrement: () {
                      age--;
                      setState(() {});
                    },
                    onIncrement: () {
                      age++;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: _calculate,
              child: const Text(
                'CALCULATE',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _calculate() {
    final heightInMeters = height / 100;
    final bmi = weight / (heightInMeters * heightInMeters);
    log(bmi.toString());
    _showDialog(bmi.toInt());
  }

  String getTitle(int bmi) {
    if (bmi < 18.5) {
      return 'Ээх бир аз арык экенсиз';
    } else if (bmi < 25) {
      return 'Азаматсыз!!!';
    } else if (bmi < 30) {
      return 'Ашыкча салмагыңыз бар';
    } else {
      return 'Ашыкча салмагыңыз бар...';
    }
  }

  String getDescription(int bmi) {
    if (bmi < 18.5) {
      return 'Пайдалуу тамактанып ден-соолукка кам көрүңүз. Сиздин индексиңиз: $bmi';
    } else if (bmi < 25) {
      return 'Идеалдуу экенсиз! Ушунуңуздан жазбаңыз. Сиздин индексиңиз: $bmi';
    } else if (bmi < 30) {
      return 'Элдер укса эмне дейт. Спортко тез арада кайтыңыз. Сиздин индексиңиз: $bmi';
    } else {
      return 'Келиңиз чогуу Спортко кайталы. Биринчи байлык ден-соолук!';
    }
  }

  String getEmoji(int bmi) {
    if (bmi < 18.5) {
      return '😕';
    } else if (bmi < 25) {
      return '🥳';
    } else if (bmi < 30) {
      return '🤓';
    } else {
      return '😲';
    }
  }

  void _showDialog(int bmi) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            getTitle(bmi),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            children: [
              Text(
                getEmoji(bmi),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                getDescription(bmi),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Макул'),
            ),
          ],
        );
      },
    );

    isMale = true;
    height = 175;
    weight = 60;
    age = 25;
    setState(() {});
  }
}
