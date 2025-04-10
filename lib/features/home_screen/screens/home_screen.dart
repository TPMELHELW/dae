import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/screens/widgets/daeah_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/moalem_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/prayer_time_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    Get.put(HomeController());
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrayerTimeWidget(),
          SizedBox(height: 20),
          SearchWidget(),
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
    );
  }
}
