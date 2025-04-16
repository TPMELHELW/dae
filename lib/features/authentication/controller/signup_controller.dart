import 'dart:async';
import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/authentication/models/user_model.dart';
import 'package:dae/repository/auth_repository.dart';
import 'package:dae/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  late TextEditingController email, password, phoneNumber, name;
  late Rx<StatusRequest> statusRequest;
  final List<String> items = ['معلم', 'داعي'];
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String alsafa = 'داعي';
  final AuthRepository _authRepository = Get.put(AuthRepository());

  Future<void> signUpWithEmail() async {
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
      final user = await _authRepository.signUpWithEmail(
        email.text.trim(),
        password.text.trim(),
      );
      final userData = UserModel(
        id: user.user!.uid,
        email: email.text.trim(),
        number: phoneNumber.text.trim(),
        isDaea: alsafa == items[1],
        userName: name.text.trim(),
        numberOfMuslims: '0',
        muslims: [],
      );

      await UserRepository().saveUserInf(userData);

      await _authRepository.sendEmailVerification();
      Get.offNamed(AppRoutes.login);
      showSuccessSnackbar(
        'Success',
        'الرجاء تفعيل الايميل لكي تستطيع تسجيل الدخول',
      );
      statusRequest.value = StatusRequest.success;
      update();
    } catch (e) {
      showErrorSnackbar('Failed', e.toString());
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phoneNumber = TextEditingController();
    name = TextEditingController();
    statusRequest = StatusRequest.init.obs;
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phoneNumber.dispose();
    super.onClose();
  }
}
