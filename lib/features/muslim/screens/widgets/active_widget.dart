import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ActiveWidget extends StatelessWidget {
  // final String text;
  final bool isActive;
  const ActiveWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.active : AppColors.nonActive,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          isActive ? 'متابع' : 'غير متابع',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: isActive ? AppColors.kPrimaryColor : AppColors.textNonActive,
          ),
        ),
      ),
    );
  }
}
