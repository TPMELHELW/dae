import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/muslim/controller/muslims_controller.dart';
import 'package:dae/features/settings/controller/account_settings_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<NavigationController>()) {
      Get.put(NavigationController());
      Get.put(HomeController());
      Get.put(MuslimsController());
      Get.put(AccountSettingsController());
    }
  }

  void clearAllController() {
    Get.delete<NavigationController>();
    Get.delete<HomeController>();
    Get.delete<MuslimsController>();
    Get.delete<AccountSettingsController>();
  }
}
