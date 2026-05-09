import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_azfh/pages/my_health.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
initialRoute: '/',
      getPages: [
   GetPage(     name: '/',  page: () => MyHealth(),  ),
  //         GetPage(name: '/', page: () => Signin()),
  //       GetPage(name: '/otp', page: () => OtpPage()),
  //   GetPage(name: '/home', page: () => Homepage()),
      ]
    );
  }
}


//hi