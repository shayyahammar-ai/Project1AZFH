import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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