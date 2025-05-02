import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/screens/widgets/daeah_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/moalem_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/prayer_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    final HomeController homeController = HomeController.instance;
    return LiquidPullToRefresh(
      onRefresh: () {
        homeController.getNextPrayerInfo(homeController.prayerTimes.value!);
        return homeController.getRemainingTime();
      },
      color: AppColors.light,
      backgroundColor: AppColors.dark,
      showChildOpacityTransition: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrayerTimeWidget(),
            Obx(
              () =>
                  controller.userData.value?.isDaea == null
                      ? Lottie.asset('assets/animation/loading.json')
                      : controller.userData.value!.isDaea
                      ? DaeahWidget()
                      : MoalemWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
