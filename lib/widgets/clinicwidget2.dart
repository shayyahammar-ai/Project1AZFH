import 'package:flutter/material.dart';

class ClinicCardDoctor extends StatelessWidget {
  const ClinicCardDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),

        color:const Color.fromARGB(255, 2, 33, 47),
      ),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Clinic.name', style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold),),
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

    );
  }
}