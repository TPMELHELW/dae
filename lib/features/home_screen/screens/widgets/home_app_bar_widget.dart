import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    return AppBar(
      backgroundColor: AppColors.light,
      leadingWidth: 150,
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
            Obx(
              () =>
                  controller.statusRequest.value == StatusRequest.loading
                      ? Lottie.asset(
                        'assets/animation/loading.json',
                        height: 50,
                      )
                      : Text(
                        controller.userData.value!.userName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
