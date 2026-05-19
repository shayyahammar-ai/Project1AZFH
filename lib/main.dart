import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_azfh/UI/home/favorite_page.dart';
import 'package:project_azfh/UI/home/my_sitting_page.dart';
import 'package:project_azfh/controller/Theme_Controller.dart';
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



initialRoute: '/',
      getPages: [
   GetPage(     name: '/',  page: () => MySittingPage(),),

      ]
    ));
  }
}


//hi