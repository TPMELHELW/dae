import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/validation/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  // final bool obscure;
  const PasswordTextFieldWidget({
    super.key,
    this.controller,
    // required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    Rx<bool> obscure = true.obs;
    return Obx(
      () => TextFormField(
        obscureText: obscure.value,
        validator: (value) => AppFieldValidator.validatePassword(value),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscure.value ? Iconsax.eye_slash : Iconsax.eye,
              color: AppColors.border,
            ),
            onPressed: () {
              obscure.value = !obscure.value;
            },
          ),
          hintText: 'كلمة السر',
          hintTextDirection: TextDirection.rtl,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

            borderSide: BorderSide(color: AppColors.border),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.border),
          ),
        ),
      ),
    );
  }
}
