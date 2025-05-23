import 'package:dae/core/components/button_widget.dart';
import 'package:dae/features/authentication/controller/login_controller.dart';
import 'package:dae/features/authentication/screens/login_screen/widgets/form_login_widget.dart';
import 'package:dae/features/authentication/screens/login_screen/widgets/no_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
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
                'تسجيل الدخول',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'ادخل حسابك و كلمت السر',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              const FormLoginWidget(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ButtonWidget(
                text: 'تسجيل دخول',
                onPress: () async => await controller.signInWithEmail(),
                statusRequest: controller.statusRequest,
              ),
              const SizedBox(height: 10),
              const NoAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
