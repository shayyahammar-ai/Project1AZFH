import 'package:flutter/material.dart';
import 'package:project_azfh/show_doctor_page/Appointements_list.dart';
import 'package:project_azfh/show_doctor_page/set_appointement.dart';
import 'package:project_azfh/show_doctor_page/show_doctor_header.dart';

Color lightGreen = Color(0xfff13A6A8);
Color DarkGreen = Color(0xfff093B68);

class show_doctor_page extends StatefulWidget {
  const show_doctor_page({super.key});

  @override
  State<show_doctor_page> createState() => _show_doctor_pageState();
}

class _show_doctor_pageState extends State<show_doctor_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF0F7F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              show_doctor_header(),
              set_appointement(),
              AppointmantsList(),
            ],
          ),
        ),
      ),
    );
  }
}
