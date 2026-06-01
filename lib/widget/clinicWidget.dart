import 'package:flutter/material.dart';
import 'package:project_azfh/Models/Clinic.dart';

class ClinicCard extends StatelessWidget {
  
  
  const ClinicCard({super.key, });

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
                "Clinic name",
              style: TextStyle(color:Colors.white,
              fontWeight: FontWeight.bold,fontSize: 12),),
               SizedBox(height:20 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.people,color: Colors.grey,size: 14,),
                Text( 'number', 
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