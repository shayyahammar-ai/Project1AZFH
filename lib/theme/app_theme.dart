import 'package:flutter/material.dart';

class AppTheme {
    static const Color accent = Color(0xFF5E9CFF);
  static const Color card = Color(0xFF141F34);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: const Color(0xFF141F34),
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xffADC6FF), // لون الزر في الدارك
    foregroundColor: Colors.black,      // لون النص
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),

    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Color(0xffADC6FF),
    //   textTheme: ButtonTextTheme.primary,
    // ),
 
  iconTheme: const IconThemeData(color: Color(0xffADC6FF)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xffC2C6D6)),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 24, 31, 56),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 24, 31, 56),
    titleTextStyle: TextStyle(color: Color(0xffE1E2EC), fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Color(0xffADC6FF)),
  ),
);


  static final ThemeData lightTheme = ThemeData.light().copyWith(
cardColor: const Color(0xFFF2F2F2),
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xff11AAA8), // لون الزر في اللايت
    foregroundColor: Colors.white,      // لون النص
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),

  //  buttonTheme: const ButtonThemeData(
  //     buttonColor: Color(0xff11AAA8),
  //     textTheme: ButtonTextTheme.primary,
  //   ),
     badgeTheme: const BadgeThemeData(
      backgroundColor: Color(0xff11AAA8),
      textColor: Colors.white,
    ),
   iconTheme: const IconThemeData(color: Color(0xff11AAA8)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color.fromARGB(255, 172, 170, 170)),
  ),
  scaffoldBackgroundColor: Color(0xffFEFEFE),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffFEFEFE),

    titleTextStyle: TextStyle(color: Color.fromARGB(255, 172, 170, 170), fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Color(0xff11AAA8)),
  ),
  );
}
