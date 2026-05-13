import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({ this.onTap,required this.text});
String text;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 204, 52, 6),
      
            ),
            height: 40,
            width: double.infinity,
            child: Center(child: Text(text),
            ),
            ),
    );
  }
}