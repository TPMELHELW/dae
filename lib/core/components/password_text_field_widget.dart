import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/validation/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  const PasswordTextFieldWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => AppFieldValidator.validatePassword(value),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: SizedBox(
          width: 112,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Iconsax.eye, color: AppColors.border),
                onPressed: () {
                  // handle clear
                },
              ),
              SizedBox(
                height: 45,
                child: VerticalDivider(color: AppColors.border, thickness: 1),
              ),
              IconButton(
                icon: Icon(Iconsax.info_circle, color: AppColors.border),
                onPressed: () {
                  // handle search
                },
              ),
            ],
          ),
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
    );
  }
}
