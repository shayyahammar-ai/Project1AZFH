import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_azfh/controller/Theme_Controller.dart';
import 'package:project_azfh/pages/my_health.dart';
import 'package:project_azfh/pages/my_sitting_page.dart';
import 'package:project_azfh/theme/app_theme.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final themeController = Get.find<ThemeController>();


    return Obx(() =>GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
       themeMode: themeController.themeMode,
// theme: ThemeData.dark().copyWith
// (
//   iconTheme: const IconThemeData(color: Color.fromARGB(255, 142, 141, 141)),
//   textTheme: const TextTheme(
//     bodyMedium: TextStyle(color: Color.fromARGB(255, 251, 252, 252)),
//   ),
//   scaffoldBackgroundColor: Color.fromARGB(255, 16, 2, 46),

//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color.fromARGB(255, 16, 2, 46),
//     titleTextStyle: TextStyle(color: Color.fromARGB(255, 164, 191, 244), fontSize: 20, fontWeight: FontWeight.bold),
//     iconTheme: IconThemeData(color: Color.fromARGB(255, 234, 230, 230)),
//   ),
// ),


initialRoute: '/',
      getPages: [
   GetPage(     name: '/',  page: () => MySittingPage(),),
  //         GetPage(name: '/', page: () => Signin()),
  //       GetPage(name: '/otp', page: () => OtpPage()),
  //   GetPage(name: '/home', page: () => Homepage()),
      ]
    ));
  }
}


//hi