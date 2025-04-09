import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ActiveWidget extends StatelessWidget {
  final String text;
  const ActiveWidget({super.key, this.text = 'نشط'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.active,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.kPrimaryColor),
        ),
      ),
    );
  }
}
