import 'package:dae/core/components/button_widget.dart';
import 'package:dae/features/authentication/controller/signup_controller.dart';
import 'package:dae/features/authentication/screens/login_screen/widgets/no_account_widget.dart';
import 'package:dae/features/authentication/screens/signup_screen/widgets/form_signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ).copyWith(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'انشاء حساب',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'ادخل بيانات انشاء الحساب',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              FormSignupWidget(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ButtonWidget(
                text: 'تسجيل دخول',
                onPress: () async => await controller.signUpWithEmail(),
                statusRequest: controller.statusRequest,
              ),
              SizedBox(height: 10),
              NoAccountWidget(isLogin: false),
            ],
          ),
        ),
      ),
    );
  }
}
