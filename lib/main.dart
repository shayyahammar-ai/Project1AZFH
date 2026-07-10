import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_azfh/Notification/notification_all_stutus.dart';
import 'package:project_azfh/UI/auth/SplashScreen.dart';
import 'package:project_azfh/controller/Theme_Controller.dart';
import 'package:project_azfh/my_health/my_health.dart';
import 'package:project_azfh/screens/chat_AI.dart';
import 'package:project_azfh/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on bachground💜💜💜💜💜💜 message');
  print(message.data.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//await FirebaseNotifications.initializeFirebase();استدعاء تبع ابو كم ما اشتغل 
// 1. طلب صلاحية إرسال الإشعارات (مهم جداً للأندرويد 13 فما فوق)
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // 2. تفعيل الاستماع للإشعارات في الخلفية (السطر الذي كان ناقصاً)
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);



  //here tokenn to bashar
  var device_token = await FirebaseMessaging.instance.getToken();
  print("Firebase Messaging ❤️Token: $device_token");

  // //forground
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  // });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
  });
  // استبدل هذا الجزء في كودك الحالي
  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  // });

  // بالكود الجديد الرائع باستخدام GetX:
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Foreground Message Received!');
    
    // التأكد من أن الرسالة تحتوي على إشعار (عنوان ونص)
    if (message.notification != null) {
      Get.snackbar(
        message.notification!.title ?? 'إشعار جديد', // عنوان الإشعار
        message.notification!.body ?? '',            // نص الإشعار
        snackPosition: SnackPosition.TOP,            // ظهوره من الأعلى مثل إشعارات النظام
        backgroundColor: Colors.white,               // لون الخلفية
        colorText: Colors.black87,                   // لون النص
        icon: const Icon(
          Icons.notifications_active, 
          color: Color(0xFF15A5A5),                  // لون أيقونة الإشعار متناسق مع تصميمك
        ),
        margin: const EdgeInsets.all(15),            // هوامش ليكون شكله أنيقاً
        borderRadius: 15,                            // حواف دائرية
        duration: const Duration(seconds: 4),        // مدة ظهوره على الشاشة
        boxShadows: [                                // إضافة ظل خفيف للإشعار
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      );
    }
  });

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
        getPages: [GetPage(name: '/', page: () => SplashScreen())],
      ),
    );
  }
}


//ammmmm
  //merge with hawraa
  //