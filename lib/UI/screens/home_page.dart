import 'dart:math';


import 'package:flutter/material.dart';
import 'package:project_azfh/list/clinicList.dart';
import 'package:project_azfh/list/doctorList.dart';
import 'package:project_azfh/list/reminderList.dart';
import 'package:project_azfh/widget/clinicWidget.dart';
import 'package:project_azfh/widget/doctorWidget.dart';

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
    randomReminder = medicalReminders[Random().nextInt(medicalReminders.length)];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
     backgroundColor:const Color(0xFF2F8F7),
      body: 
      ListView(
        children: [
      
       Stack(
        clipBehavior:Clip.none,
         children:[ Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
          color:Color.fromARGB(255, 6, 79, 73), 
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(35),bottomRight:Radius.circular(35))
          ),
           child: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('Welcome to Clinico', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 237, 222, 222),
                  fontSize: 20
                ),),
                Text('Caring for you and your loved ones, wherever you are', style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 212, 202, 202)),
                ),        
              ],
            ),
          ),
         ),
          // Positioned(
            
          //   child: 
          // Container(
          //    decoration:BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.blueGrey,
              
          //   ),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.search,color: Colors.grey,
                 
          //       ), 
          //       Text('Search', style: TextStyle(color: Colors.grey),),
          //       Icon(Icons.filter_1_rounded),
          //     ],
          
          //   ),
           
          // )
          // ),

          Positioned(
        bottom: -80,
        left: 0,
        right: 0,
         child: SizedBox(
          height: 160,
          child: ListView.builder(
            
            shrinkWrap: true,
               scrollDirection: Axis.horizontal,
                 itemCount: doctors.length,
                 itemBuilder: (context, index){
                  return DoctorCard(doctor: doctors[index]);
                 }

              ),
                 
               ),
               
       ),
       
        ]),
      
         SizedBox(height: 120,),
          //       Reminders
         Padding(
           padding: const EdgeInsets.all(10),
           child: Container(
            decoration: BoxDecoration(
             boxShadow:[
                          BoxShadow(
                        blurRadius: 2,
               color: Colors.grey)
                        ],
              borderRadius: BorderRadius.circular(40),
              color: const Color.fromARGB(255, 178, 170, 170),  
            ),
            height: 50,
           width: 300,
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Row(
                children: [
                  SizedBox(width: 5,),
                  Icon(
                  Icons.info,
                  color:Color.fromARGB(255, 151, 17, 8),
                  ),
                  SizedBox(width: 8,),
                  Text(randomReminder, 
                  style: TextStyle(color:const Color.fromARGB(255, 151, 3, 3),
                   fontWeight: FontWeight.bold),),
                  
                ],),
             ),
           ),
         ),
         SizedBox(height: 30,),
         GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
           gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10,
              childAspectRatio: 0.8),
            itemCount: myClinics.length,
           itemBuilder: (context,index){
           return ClinicCard(clinic: myClinics[index],);
         
           }),
            
          
          

       
        ])
    );  
  }
}