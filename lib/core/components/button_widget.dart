import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/muslim/screens/widgets/show_edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 48),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () => Get.toNamed(AppRoutes.home),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(color: Colors.white),
      ),
    );
  }
}
