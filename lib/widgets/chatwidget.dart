
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 10,),
             CircleAvatar(
      
             radius: 25,
             ),
             SizedBox(width: 10,),
      
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text('Dr.name', style: TextStyle(color: Colors.black, fontSize: 22),),
                 Text('Last Message', style: TextStyle(fontSize: 13),),
      
               ],
             ),
                 
             Spacer(),
             Column( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('11:30 pm',style:TextStyle(color: Colors.grey) ,),
                Text('5', style: TextStyle(color: const Color.fromARGB(255, 43, 166, 48)),)
              ],
             )
       
      
          ],
        ),
      
      
      ),
    );
  }
}