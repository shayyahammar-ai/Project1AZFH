
import 'package:clinico/Models/Doctor.dart';
import 'package:flutter/material.dart';



class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key,
  required this.doctor});

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
              Text(doctor.name!,
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold, color: Colors.white),),
                     
              Text(doctor.medicalSpecialty!,
              style: TextStyle(color: Colors.grey, fontSize: 10)),
              
              // Text( doctor.age?.toString()?? "",
              // style: TextStyle(fontSize: 10,
              //   fontWeight: FontWeight.bold, color: Colors.grey),),
                     

              SizedBox(height: 55,),
              Row(
                children: 
                 List.generate(5, 
                 (index)=> Icon(
                  index < doctor.rating!
                  ?Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                 ))
               
                            
                
              )
              
              ]),
               CircleAvatar(
               radius: 60,
                backgroundImage: AssetImage(doctor.asset!),),
              
            ],
          ),

          
          
         
        ),
    );
  }
} 

