import 'dart:convert';
import 'dart:developer';

import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/services/shared_preferences_services.dart';
import 'package:dae/features/authentication/models/user_model.dart';
import 'package:dae/features/home_screen/screens/home_screen.dart';
import 'package:dae/features/muslim/screens/muslim_screen.dart';
import 'package:dae/features/settings/screens/account_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find<NavigationController>();

  final Rx<int> currentIndex = 0.obs;
  late Rx<StatusRequest> statusRequest;
  final Rx<UserModel?> userData = Rx<UserModel?>(null);
  final SharedPreferencesService prefsService =
      Get.find<SharedPreferencesService>();

  final List<Widget> screens = const [
    HomeScreen(),
    MuslimScreen(),
    AccountSettingsScreen(),
  ];

  void onSelect(int index) {
    currentIndex.value = index;
  }

  Future<void> loadUserData() async {
    try {
      statusRequest.value = StatusRequest.loading;
      final userString = await prefsService.getString('UserData');
      log(userString!);
      if (userString != null) {
        userData.value = UserModel.fromStorage(await json.decode(userString));
        statusRequest.value = StatusRequest.success;
      }
    } catch (e) {
      statusRequest.value = StatusRequest.notValidate;

      Get.snackbar('Error', 'Failed to load user data');
      print('Error loading user data: $e');
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.init.obs;
    await loadUserData();
    super.onInit();
  }
}
