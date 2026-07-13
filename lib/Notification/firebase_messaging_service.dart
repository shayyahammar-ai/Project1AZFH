import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_azfh/controller/notification_controller.dart';
import '../firebase_options.dart'; // تأكد من صحة مسار هذا الملف عندك

// 💡 ملاحظة هامة: دالة الخلفية يجب أن تبقى خارج الكلاس (Top-level function)
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background💜💜💜💜💜💜 message');
  print(message.data.toString());
}

class FirebaseMessagingService {
  // دالة واحدة تجمع كل التهيئة
  static Future<void> init() async {
    // 1. تهيئة فايربيس
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // 2. طلب صلاحية إرسال الإشعارات
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // 3. تفعيل الاستماع للإشعارات في الخلفية
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 4. طباعة التوكن للتأكد من عمله
    var deviceToken = await FirebaseMessaging.instance.getToken();
    print("Firebase Messaging ❤️Token: $deviceToken");

    // 5. الاستماع لفتح التطبيق من إشعار
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Opened App from Notification: ${message.data.toString()}");

        if (Get.isRegistered<NotificationController>()) {
          Get.find<NotificationController>().addNotification(
            message.notification!.title ?? 'بدون عنوان',
            message.notification!.body ?? '',
          );
        }
    });

    // 6. الاستماع للإشعارات والتطبيق مفتوح (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground Message Received!');
      
      if (message.notification != null) {


// 🔴 الكود الجديد: إضافة الإشعار للكونترولر لكي يظهر في الواجهة
        if (Get.isRegistered<NotificationController>()) {
          Get.find<NotificationController>().addNotification(
            message.notification!.title ?? 'بدون عنوان',
            message.notification!.body ?? '',
          );
        }


        Get.snackbar(
          message.notification!.title ?? 'إشعار جديد',
          message.notification!.body ?? '',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.black87,
          icon: const Icon(
            Icons.notifications_active,
            color: Color(0xFF15A5A5),
          ),
          margin: const EdgeInsets.all(15),
          borderRadius: 15,
          duration: const Duration(seconds: 4),
          boxShadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        );
      }
    });
  }
}