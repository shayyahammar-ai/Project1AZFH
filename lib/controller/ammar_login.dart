

//الشغال
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:project_azfh/sample/api_service_sample.dart';
import 'package:project_azfh/screens/chat_AI.dart';
//import 'package:flutterapp2/models/models.dart';


class LoginController extends GetxController {
  var password = ''.obs;
  var email = ''.obs;

  var loginStatus = ControllerStatus.inital.obs;

  Future<void> loginFuture() async {
    loginStatus.value = ControllerStatus.loading;

    final result = await ApiServiceSample.instance.makeRequest(
      method: ApiMethodSample.post,
      endPoint: '/login',
      body: {
        "password": password.value,
        "email": email.value,
      },
    );
    result.fold(
      (left) {
        loginStatus.value = ControllerStatus.error;
        Get.snackbar("Error", left ?? "Login failed");
      },
      (right) {
        loginStatus.value = ControllerStatus.loaded;

        // نجاح تسجيل الدخول → ننتقل لصفحة OTP
      //  Get.to(() => OtpPage());
      Get.to(() => ChatAi(),);

      },
    );
  }

// الدالة المساعدة لإرسال توكن الإشعارات (وضعنا قبلها _ لتكون Private)
  Future<void> _sendDeviceTokenToBackend(String userAuthToken) async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      
      if (fcmToken != null) {
        var response = await Dio().post(
          'https://api-shayyah.abukm.com/api/device-token', // 🔴 رابط بشار لحفظ التوكن
          data: {
            'device_token': fcmToken,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $userAuthToken', 
            },
          ),
        );

        if (response.statusCode == 200) {
          print('✅ تم حفظ التوكن في السيرفر بنجاح');
        }
      }
    } catch (error) {
      print('❌ حدث خطأ أثناء إرسال التوكن: $error');
    }
  }



}
