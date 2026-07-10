// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:io' show Platform;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../firebase_options.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> setupFlutterNotifications() async {
//   const AndroidInitializationSettings androidSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   final InitializationSettings settings = InitializationSettings(
//     android: androidSettings,
//     iOS: DarwinInitializationSettings(),
//   );

//   await flutterLocalNotificationsPlugin.initialize(settings: settings);
// }

// class FirebaseNotifications {
//   final firebaseMessaging = FirebaseMessaging.instance;

//   static Future<void> initializeFirebase() async {
//     try {
//       await Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform);

//       // Initialize notifications with error handling
//       try {
//         await FirebaseNotifications().initNotifications();
//         FirebaseMessaging.onBackgroundMessage(
//             _firebaseMessagingBackgroundHandler);
//         await setupFlutterNotifications();
//       } catch (e) {
//         print('Error setting up notifications: $e');
//       }
//     } catch (e) {
//       print('Error initializing Firebase: $e');
//     }
//   }

//   Future<void> initNotifications() async {
//     try {
//       // Request permission first
//       NotificationSettings settings = await firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );

//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         print('User granted permission');
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         print('User granted provisional permission');
//       } else {
//         print('User declined or has not accepted permission');
//         return;
//       }

//       // Handle APNS token for iOS
//       if (Platform.isIOS) {
//         // Get APNS token first
//         String? apnsToken = await firebaseMessaging.getAPNSToken();
//         print('APNS Token: $apnsToken');

//         if (!kReleaseMode) {
//           String? token = await firebaseMessaging.getToken();
//           print("FCM Token: $token");
//         }
//       } else {
//         if (!kReleaseMode) {
//           String? token = await firebaseMessaging.getToken();
//           print("FCM Token: $token");
//         }
//       }

//       handleForegroundNotification();
//       handleBackgroundNotification();
//     } catch (e) {
//       print('Error initializing notifications: $e');
//     }
//   }

//   void handleMessage(RemoteMessage? message, BuildContext context) {
//     if (message == null) return;
//   }

//   Future<void> handleBackgroundNotification() async {
//     FirebaseMessaging.instance.getInitialMessage().then((message) {});

//     FirebaseMessaging.onMessageOpenedApp.listen((message) {});
//   }

//   void handleForegroundNotification() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('NTF arrived');
//       showNotification(message.notification!.title, message.notification!.body);
//     });
//   }

//   void showNotification(String? title, String? body) async {
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails details = NotificationDetails(
//         android: androidDetails, iOS: DarwinNotificationDetails());

//     await flutterLocalNotificationsPlugin.show(id:0, title:title,body: body,
//         notificationDetails: details);
//   }
// }