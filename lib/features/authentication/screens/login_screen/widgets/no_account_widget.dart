import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoAccountWidget extends StatelessWidget {
  final bool isLogin;
  const NoAccountWidget({super.key, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? 'ليس لديك حساب ؟' : 'هل لديك حساب ؟',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed:
              () =>
                  isLogin
                      ? Get.offNamed(AppRoutes.signup)
                      : Get.offNamed(AppRoutes.login),
          child: Text(
            isLogin ? 'انشاء حساب' : ' تسجيل الدخول',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.kPrimaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
