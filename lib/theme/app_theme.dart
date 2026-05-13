import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    
  iconTheme: const IconThemeData(color: Color.fromARGB(255, 142, 141, 141)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color.fromARGB(255, 251, 252, 252)),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 16, 2, 46),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 16, 2, 46),
    titleTextStyle: TextStyle(color: Color.fromARGB(255, 164, 191, 244), fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 234, 230, 230)),
  ),
);
    
  

  static final ThemeData lightTheme = ThemeData.light().copyWith(
   iconTheme: const IconThemeData(color: Color.fromARGB(255, 27, 170, 154)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color.fromARGB(255, 169, 171, 171)),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 252, 253, 252),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 27, 170, 154),

    titleTextStyle: TextStyle(color: Color.fromARGB(255, 243, 244, 245), fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 140, 138, 138)),
  ),
  );
}
