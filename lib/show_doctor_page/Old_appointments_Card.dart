import 'package:flutter/material.dart';

Color lightGreen = Color(0xfff13A6A8);

class OldAppointementsCard extends StatelessWidget {
  final String appointmentType;
  final String appointmentDate;
  final String appointmentMedicines;
  final String symptoms;

  const OldAppointementsCard({
    super.key,
    required this.appointmentType,
    required this.appointmentDate,
    required this.appointmentMedicines,
    required this.symptoms,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  appointmentType,
                  style: TextStyle(
                    color: lightGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: $appointmentDate',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Medicines:',
                      style: TextStyle(
                        color: lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(appointmentMedicines, style: TextStyle(fontSize: 13)),
                    const SizedBox(height: 12),
                    Text(
                      'Symptoms:',
                      style: TextStyle(
                        color: lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(symptoms, style: TextStyle(fontSize: 13)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close', style: TextStyle(color: lightGreen)),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 179, 235, 208).withOpacity(0.2),
            border: Border.all(color: lightGreen),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            // color: Colors.white,
            // border: Border.all(color: lightGreen),
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.08),
            //     blurRadius: 12,
            //     spreadRadius: 4,
            //     offset: Offset(0, 8),
            //   ),
            // ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointmentType,
                  style: TextStyle(
                    color: lightGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  appointmentDate,
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Medicines: ',
                      style: TextStyle(
                        color: lightGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        appointmentMedicines,
                        style: TextStyle(color: Colors.black87, fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      'Symptoms: ',
                      style: TextStyle(
                        color: lightGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        symptoms,
                        style: TextStyle(color: Colors.black87, fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
