import 'package:flutter/material.dart';
import 'package:project_azfh/my_health/Calorie_Calculator.dart';
import 'package:project_azfh/my_health/Medical_Videos.dart';
import 'package:project_azfh/my_health/QR_scan.dart';
import 'package:project_azfh/my_health/Scientific_encyclopedia.dart';
import 'package:project_azfh/my_health/medicine_reminder.dart';
import 'package:project_azfh/my_health/pregnancy_calculator.dart';
import 'package:project_azfh/my_health/body_mass_index.dart'; 
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
          custumCard(title: 'Medicine Reminder', image: 'assets/nedication_st.png',page: MedicineReminder()),
          custumCard(title: 'Scientific Encyclopedia', image: 'assets/Scientific.png',page:ScientificEncyclopedia ()),
          custumCard(title: 'QR scan', image: 'assets/Q.png',page:QrScan()),

        ],
        ),
          Row(
            children: [
            custumCard(title: 'Body Mass Index', image: 'assets/body_mass_calculator.png',page: BodyMassIndex()),
            custumCard(title: 'Calorie Calculator', image: 'assets/caloric_content.png',page: CalorieCalculator()),
            custumCard(title: 'Medical Videos', image: 'assets/video.png',page: MedicalVideos()),
          ],
          ),
      ],)
    );
  }
}
/**
 * 1.منبه الدوا
 * 2الكتلة    
 * 3 qr scan
 * 4 موسوعة علمية 
 * 5 قيديو
 * 6 سعرات حرارية 
 */
