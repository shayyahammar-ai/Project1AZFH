import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white,
     appBar: AppBar(
      shadowColor: Colors.black,
      backgroundColor: const Color.fromARGB(255, 2, 33, 47),
      title: Text("Clinico", style: TextStyle(color: Colors.white)),
      ),


    );
  }
}