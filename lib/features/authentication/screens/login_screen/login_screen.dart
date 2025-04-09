import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/authentication/screens/login_screen/widgets/form_login_widget.dart';
import 'package:dae/features/authentication/screens/login_screen/widgets/no_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // Add this
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
                onPress: () => Get.toNamed(AppRoutes.home),
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
