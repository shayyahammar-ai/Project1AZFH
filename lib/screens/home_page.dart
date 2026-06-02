import 'dart:math';
import 'package:clinico/list/imagelist.dart';
import 'package:clinico/list/reminderlist.dart';
import 'package:clinico/screens/appointment_card.dart';
import 'package:clinico/screens/doctors.dart';
import 'package:clinico/widgets/clinicwidget.dart';
import 'package:clinico/widgets/doctorwidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String randomReminder;

  @override
  void initState() {
    super.initState();
    randomReminder =
        medicalReminders[Random().nextInt(medicalReminders.length)];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // welcome
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 79, 73),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Welcome to Clinico',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 237, 222, 222),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Caring for you and your loved ones, wherever you are',
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 212, 202, 202),
                        ),
                      ),

                      //search
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 3, 117, 108),
                          ),
                          width: 400,
                          height: 40,

                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 48, 51, 51),
                              ),
                              Text(
                                "Search...",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 48, 51, 51),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.filter_list,
                                color: Color.fromARGB(255, 48, 51, 51),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // top doctors
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Top Rated Doctors",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
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
                            child: Text("See All"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
              bottom: -100,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return DoctorCard();
                    },
                  ),
                ),
              ),
            ],
          ),

          // Appointment
          SizedBox(height: 90),

          AppointmentCard(hasAppointment: false,),

          // clinics
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: clinicImages.length,
              itemBuilder: (context, index) {
                return ClinicCardHome(
                  imagePath: clinicImages[index]);
              },
            ),
          ),

          //       Reminders
          //  Padding(
          //    padding: const EdgeInsets.all(10),
          //    child: Container(
          //     decoration: BoxDecoration(
          //      boxShadow:[
          //                   BoxShadow(
          //                 blurRadius: 2,
          //        color: Colors.grey)
          //                 ],
          //       borderRadius: BorderRadius.circular(40),
          //       color: const Color.fromARGB(255, 178, 170, 170),
          //     ),
          //     height: 50,
          //    width: 300,
          //      child: Padding(
          //        padding: const EdgeInsets.all(12.0),
          //        child: Row(
          //         children: [
          //           SizedBox(width: 5,),
          //           Icon(
          //           Icons.info,
          //           color:Color.fromARGB(255, 151, 17, 8),
          //           ),
          //           SizedBox(width: 8,),
          //           Text(randomReminder,
          //           style: TextStyle(color:const Color.fromARGB(255, 151, 3, 3),
          //            fontWeight: FontWeight.bold),),

          //         ],),
          //      ),
          //    ),
          //  ),
        ],
      ),
    );
  }
}
