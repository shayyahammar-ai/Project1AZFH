import 'package:clinico/widgets/chatwidget.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white,
     appBar: AppBar(
      shadowColor: Colors.black,
      backgroundColor:Color.fromARGB(255, 6, 79, 73),
      title: Text("Chat", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
           children: [
           ChatCard(),
           ChatCard()
           ],
      ),
    );
  }
}

