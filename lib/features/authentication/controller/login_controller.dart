import 'dart:convert';
import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/core/services/shared_preferences_services.dart';
import 'package:dae/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();
  late TextEditingController email, password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> fpformState = GlobalKey<FormState>();
  late Rx<StatusRequest> statusRequest;
  final SharedPreferencesService _prefsService =
      Get.find<SharedPreferencesService>();
  final AuthRepository _authRepository = Get.put(AuthRepository());

  Future<void> signInWithEmail() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }
      if (!formState.currentState!.validate()) {
        statusRequest.value = StatusRequest.notValidate;
        update();
        return;
      }
      statusRequest.value = StatusRequest.loading;
      update();

      final cred = await _authRepository.signInWithEmail(
        email.text.trim(),
        password.text.trim(),
      );
      _prefsService.setString('UserData', json.encode(cred.data()));
      statusRequest.value = StatusRequest.success;
      update();
      showSuccessSnackbar('Success', 'Log in Success');
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      showErrorSnackbar('Failed', e.toString());
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  Future<void> forgetPassword() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }

      if (!fpformState.currentState!.validate()) {
        statusRequest.value = StatusRequest.notValidate;
        update();
        return;
      }
      statusRequest.value = StatusRequest.loading;
      update();
      await _authRepository.forgetPassword(email.text.trim());

      statusRequest.value = StatusRequest.success;
      showSuccessSnackbar('Success', 'Check your Email');
      update();
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;
      update();
      showErrorSnackbar('Error', e.toString());
      print(e);
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.init.obs;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
