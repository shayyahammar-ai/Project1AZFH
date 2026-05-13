import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({required this.hintText,required this.onChanged});
String? hintText;
Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
     
      
  decoration: InputDecoration(
hintText: hintText,

enabledBorder: OutlineInputBorder(

borderSide: BorderSide(
  color: Colors.black12,
),
),
border: OutlineInputBorder(
borderSide: BorderSide(
  color: Colors.white,
),


),




  ),
);
  }
}