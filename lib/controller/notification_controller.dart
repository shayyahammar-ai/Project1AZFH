import 'package:get/get.dart';

// نموذج يمثل بيانات الإشعار الواحد
class NotificationModel {
  final String title;
  final String body;
  final String timeAgo;

  NotificationModel({
    required this.title,
    required this.body,
    required this.timeAgo,
  });
}

class NotificationController extends GetxController {
  // قائمة تفاعلية (Reactive) لحفظ الإشعارات
  var notificationsList = <NotificationModel>[].obs;

  // دالة لإضافة إشعار جديد للقائمة
  void addNotification(String title, String body) {
    notificationsList.insert(
      0, // إضافته في بداية القائمة ليكون الأحدث بالأعلى
      NotificationModel(
        title: title,
        body: body,
        timeAgo: 'الآن', // افتراضياً نكتب "الآن" للرسائل الجديدة
      ),
    );
  }

  // دالة لمسح كل الإشعارات
  void clearAll() {
    notificationsList.clear();
  }
}