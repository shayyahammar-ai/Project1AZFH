
import 'package:flutter/material.dart';
import 'package:project_azfh/Models/Doctor.dart';



class DoctorCard extends StatelessWidget {
 
  const DoctorCard({super.key,
 });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right:15, top: 16),
      child: Container(
        width: 250, 
        decoration: BoxDecoration( 
        color:const Color.fromARGB(255, 2, 33, 47),
          borderRadius: BorderRadius.circular(20),
          boxShadow:[ BoxShadow(
           blurRadius: 4,
           color: Colors.black
          )],
          ),   
        child:       
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
              Text("Dr.name",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold, color: Colors.white),),
                     
              Text("medicalSpecialty",
              style: TextStyle(color: Colors.grey, fontSize: 10)),
              
              
                     

              SizedBox(height: 55,),
              Row(
                children: 
                 List.generate(5, 
                 (index)=> Icon(
                  index < 5
                  ?Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                 ))
               
                            
                
              )
              
              ]),
               CircleAvatar(
               radius: 60,
                backgroundImage: AssetImage(''),),
              
            ],
          ),

          
          
         
        ),
    );
  }
} 

