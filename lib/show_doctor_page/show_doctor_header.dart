import 'package:flutter/material.dart';

Color lightGreen = Color(0xfff13A6A8);

class show_doctor_header extends StatelessWidget {
  show_doctor_header({super.key});

  final String doctorName = 'Dr. Mahmoud';
  final String doctortype = 'Children Doctor';
  final String doctorExperience = '20 Years';
  final double doctorRate = 4.5;
  final int doctorSurgeries = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
            ),
            Positioned(
              bottom: -80,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 76,
                      backgroundImage: AssetImage('doctor.jpg'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 90),
        Center(
          child: Text(
            doctorName,
            style: TextStyle(
              color: lightGreen,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.badge_rounded, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    doctortype,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 4),
                  Text(
                    doctorRate.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timeline, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    doctorSurgeries.toString() + ' Surgery',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.hourglass_bottom_rounded,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    doctorExperience,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
