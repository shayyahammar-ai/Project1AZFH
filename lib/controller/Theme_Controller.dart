import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_azfh/theme/app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDark = true.obs;
@override
  void onInit() {
    super.onInit();
    isDark.value = CacheHelper.getBoolean(key: 'isDark');
  }
  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool value) {
    isDark.value = value;
     CacheHelper.putBoolean(key: 'isDark', value: isDark.value);
     
  }
}

