import 'package:clinico/screens/doctors.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
   const AppointmentCard({super.key, required this.hasAppointment});
   final bool hasAppointment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 150,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 20,
              left: 15,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                height: 170,
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                height: 160,
              ),
            ),
            hasAppointment
                ? Positioned(
                    top: 20,
                    left: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: const Color.fromARGB(255, 210, 183, 183),
                          ),
                        ],
                      ),
                      height: 150,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Upcoming Appointment:",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 122, 8, 8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                "Dr.name",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 11, 0, 13),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Clinic.name"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.date_range, size: 15),
                                  Text(
                                    "Day _ ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Icon(Icons.punch_clock, size: 15),
                                  Text("Time", style: TextStyle(fontSize: 15)),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const Doctors(),
                                    ),
                                  );
                                },
                                child: Text("See Details!"),
                              ),
                            ],
                          ),

                          CircleAvatar(radius: 40),
                        ],
                      ),
                    ),
                  )
                : Positioned(
                    top: 20,
                    left: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: const Color.fromARGB(255, 218, 212, 212),
                          ),
                        ],
                      ),
                      height: 150,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            " NO Upcoming Appointment!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 122, 8, 8),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Take care of your health",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "and Book your visit now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const Doctors(),
                                ),
                              );
                            },
                            child: Text(
                              " Find a doctor",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
