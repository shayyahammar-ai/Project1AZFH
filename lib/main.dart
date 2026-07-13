import 'package:flutter/material.dart';
import 'package:get/get.dart'; // 🔴 استدعاء واحد يغني عن كل الأسطر الطويلة
import 'package:project_azfh/Notification/firebase_messaging_service.dart';
import 'package:project_azfh/UI/auth/SplashScreen.dart';
import 'package:project_azfh/controller/Theme_Controller.dart';
import 'package:project_azfh/my_health/my_health.dart';
import 'package:project_azfh/screens/notification_screen.dart';
import 'package:project_azfh/theme/app_theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 🔥 سطر واحد فقط يكفي لتهيئة فايربيس وتشغيل كل الإشعارات
    await FirebaseMessagingService.init();



  await CacheHelper.init();
  Get.put(ThemeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.themeMode,

        initialRoute: '/',
        getPages: [GetPage(name: '/', page: () => NotificationScreen())],
      ),
    );
  }
}


//ammmmm
  //merge with hawraa
  //
