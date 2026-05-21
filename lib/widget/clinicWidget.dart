import 'package:clinico/Models/Clinic.dart';
import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  final Clinic clinic;
  
  const ClinicCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
                      color:Color.fromARGB(255, 6, 79, 73), 
                      boxShadow:[
                        BoxShadow(
                      blurRadius: 2,
             color: Colors.black)
                      ]
        ),
        
        
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                clinic.name!,
              style: TextStyle(color:Colors.white,
              fontWeight: FontWeight.bold,fontSize: 12),),
               SizedBox(height:20 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.people,color: Colors.grey,size: 14,),
                Text( '${clinic.doctors.length} Doctors', 
                style: TextStyle(color: Colors.grey, fontSize: 12),),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}