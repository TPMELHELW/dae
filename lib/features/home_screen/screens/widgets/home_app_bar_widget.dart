import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.light,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              'اهلا , بيك',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text('محمد محسن', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
