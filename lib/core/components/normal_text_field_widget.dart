import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NormalTextFieldWidget extends StatelessWidget {
  final String text;
  final TextInputType? textType;
  final Widget? prefixIcon;
  final double contentPadding;
  final bool isDense;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const NormalTextFieldWidget({
    super.key,
    required this.text,
    this.textType = TextInputType.name,
    this.prefixIcon,
    this.contentPadding = 16,
    this.isDense = true,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.all(contentPadding),
        hintText: text,
        isDense: isDense,
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
