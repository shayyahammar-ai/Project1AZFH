import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_azfh/sample/api_service_sample.dart'; // تأكد من مسار الاستيراد الصحيح

// نموذج البيانات


class ChatController extends GetxController {
  // الحقول التفاعلية للواجهة
  var messages = <ChatMessage>[].obs;
  var chatStatus = ControllerStatus.inital.obs; // بدلاً من isLoading
  
  final TextEditingController textController = TextEditingController();

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // 1. إضافة رسالة المريض إلى الواجهة
    messages.insert(0, ChatMessage(text: text, isUser: true));
    
    // 2. تغيير الحالة إلى تحميل
    chatStatus.value = ControllerStatus.loading;
    textController.clear();

    // 3. إرسال الطلب عبر ApiServiceSample
    final result = await ApiServiceSample.instance.makeRequest(
      method: ApiMethodSample.post,
      endPoint: '/ask_ai',
      // ملاحظة: استخدمت queryParams بناءً على إعدادات Postman السابقة لديك.
      // إذا قمت بتعديل الباك اند لتستقبل البيانات في الـ Body، قم بتغييرها إلى: body: {"message": text}
      queryParams: {
        "message": text,
      },
    );

    // 4. معالجة النتيجة باستخدام fold (يسار: خطأ، يمين: نجاح)
    result.fold(
      (leftError) {
        // حالة الخطأ
        chatStatus.value = ControllerStatus.error;
        _showError(leftError ?? "حدث خطأ غير معروف في الاتصال.");
        // يمكنك إبقاء الـ snackbar إذا كنت تفضل ظهوره أيضاً
        // Get.snackbar("خطأ", leftError ?? "فشل في الحصول على رد"); 
      },
      (rightData) {
        // حالة النجاح
        chatStatus.value = ControllerStatus.loaded;
        
        // استخراج الرد (تأكد أن المفتاح هو 'reply' كما ظهر في Postman)
        final aiResponse = rightData['reply'] ?? "لم أتمكن من قراءة الرد من الخادم.";
        messages.insert(0, ChatMessage(text: aiResponse, isUser: false));
      },
    );
  }

  // دالة مساعدة لعرض الخطأ كرسالة داخل المحادثة
  void _showError(String error) {
    messages.insert(0, ChatMessage(text: error, isUser: false));
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}