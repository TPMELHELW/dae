import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/screens/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;

    return Scaffold(
      appBar: HomeAppBarWidget(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.onSelect,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'المسلمين'),
            NavigationDestination(
              icon: Icon(Iconsax.setting),
              label: 'الاعدادات',
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
        ),
      ),
    );
  }
}
