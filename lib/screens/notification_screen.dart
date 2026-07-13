import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_azfh/controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // استدعاء الكونترولر
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // إجبار الواجهة لتكون من اليمين لليسار
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA), // لون خلفية رمادي فاتح جداً
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'الإشعارات',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton.icon(
              onPressed: () => controller.clearAll(),
              icon: const Icon(Icons.playlist_add_check, color: Colors.grey),
              label: const Text(
                'قراءة الكل',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
        body: Obx(() {
          // إذا كانت القائمة فارغة
          if (controller.notificationsList.isEmpty) {
            return const Center(
              child: Text(
                'لا توجد إشعارات حالياً',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          // بناء قائمة الإشعارات
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.notificationsList.length,
            itemBuilder: (context, index) {
              final item = controller.notificationsList[index];
              return _buildNotificationCard(item);
            },
          );
        }),
      ),
    );
  }

  // ويدجت منفصلة لبناء شكل بطاقة الإشعار (مطابقة للصورة)
  Widget _buildNotificationCard(NotificationModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصف العلوي (العنوان + أيقونة الساعة)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.access_time, color: Colors.grey, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // نص الإشعار
          Padding(
            padding: const EdgeInsets.only(right: 24), // إزاحة بسيطة ليتماشى مع العنوان
            child: Text(
              item.body,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5, // مسافة مريحة بين السطور
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // وقت الإشعار في الأسفل (يسار)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.timeAgo,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}