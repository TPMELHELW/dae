import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NormalTextFieldWidget extends StatelessWidget {
  final String text;
  final TextInputType? textType;
  final Widget? prefixIcon;
  const NormalTextFieldWidget({
    super.key,
    required this.text,
    this.textType = TextInputType.name,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: text,
        hintTextDirection: TextDirection.rtl,
        enabledBorder: OutlineInputBorder(
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
