import 'package:flutter/material.dart';
import 'package:project_azfh/UI/my_health/Body_Mass_Index.dart';
import 'package:project_azfh/UI/my_health/Calorie_Calculator.dart';
import 'package:project_azfh/UI/my_health/Medical_Videos.dart';
import 'package:project_azfh/UI/my_health/Pregnancy_Calculator.dart';
import 'package:project_azfh/UI/my_health/medicine_reminder.dart';
import 'package:project_azfh/UI/my_health/menstrual_cycle.dart';

import 'package:project_azfh/widget/custom_card.dart';

class MyHealth extends StatelessWidget {
  const MyHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Health'),
      ),
      body: Column(children: [
        Row(
          children: [
          custumCard(title: 'Medicine Reminder', image: 'https://img.icons8.com/fluency/96/pill.png',page: MedicineReminder()),
            custumCard(title: 'Menstrual Cycle', image: 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png',page: MenstrualCycle()),
            custumCard(title: 'Pregnancy Calculator', image: 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png',page: PregnancyCalculator()),
        ],
        ),
          Row(
            children: [
            custumCard(title: 'Body Mass Index', image: 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png',page: BodyMassIndex()),
              custumCard(title: 'Calorie Calculator', image: 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png',page: CalorieCalculator()),
              custumCard(title: 'Medical Videos', image: 'https://cdn-icons-png.flaticon.com/512/2965/2965567.png',page: MedicalVideos()),
          ],
          ),
      ],)
    );
  }
}