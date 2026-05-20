import 'package:flutter/material.dart';
import 'package:project_azfh/show_doctor_page/Old_appointments_Card.dart';

Color lightGreen = Color(0xfff13A6A8);

class AppointmantsList extends StatefulWidget {
  const AppointmantsList({super.key});

  @override
  State<AppointmantsList> createState() => _AppointmantsListState();
}

class _AppointmantsListState extends State<AppointmantsList> {
  final List<Map<String, String>> allAppointments = [
    {
      'type': 'Allergy consultation',
      'date': 'Friday, 15 May 2026',
      'medicines': 'Paracitamol, Hystamine, Vitamine D, Vitamine E',
      'symptoms': 'Cough, Sneezing, Itchy eyes, Runny nose',
    },
    {
      'type': 'General Checkup',
      'date': 'Monday, 10 May 2026',
      'medicines': 'Vitamin C, Iron, Calcium',
      'symptoms': 'Fatigue, Headache, Muscle pain',
    },
    {
      'type': 'Dental Cleaning',
      'date': 'Wednesday, 5 May 2026',
      'medicines': 'Painkillers, Antibiotics',
      'symptoms': 'Tooth pain, Gum swelling',
    },
    {
      'type': 'Eye Test',
      'date': 'Sunday, 25 April 2026',
      'medicines': 'Eye drops, Omega-3',
      'symptoms': 'Blurred vision, Dry eyes',
    },
    {
      'type': 'Physiotherapy',
      'date': 'Thursday, 20 April 2026',
      'medicines': 'Muscle relaxants',
      'symptoms': 'Back pain, Stiff neck',
    },
  ];

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedAppointments;

    if (showAll) {
      displayedAppointments = allAppointments;
    } else {
      displayedAppointments = allAppointments.take(2).toList();
    }

    return Column(
      children: [
        Text(
          'Last Appointments',
          style: TextStyle(
            color: lightGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 10),

        ...displayedAppointments.map((appointment) {
          return OldAppointementsCard(
            appointmentType: appointment['type']!,
            appointmentDate: appointment['date']!,
            appointmentMedicines: appointment['medicines']!,
            symptoms: appointment['symptoms']!,
          );
        }).toList(),

        if (allAppointments.length > 2)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: lightGreen),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  showAll ? '▲ Show Less' : '▼ Show More',
                  style: TextStyle(
                    color: lightGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),

        const SizedBox(height: 30),
      ],
    );
  }
}
