import 'package:flutter/material.dart';

class ClinicCardHome extends StatelessWidget {
  
  final String imagePath;
  const ClinicCardHome({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           
      
             CircleAvatar(
              
                  radius: 40,
                  
                  backgroundColor:Color(0xFF148A8A),
                  child:
                  
                  Image.asset(imagePath, height: 50,),
             ),
          
          ],
        ),
      ),
    );
  }
}