import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  final String text;
  const CustomDividerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 2, color: AppColors.kPrimaryColor),
        ),
        Text(text, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
