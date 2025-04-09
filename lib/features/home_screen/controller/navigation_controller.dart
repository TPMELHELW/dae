import 'package:dae/features/home_screen/screens/home_screen.dart';
import 'package:dae/features/muslim/screens/muslim_screen.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  void onSelect(index) {
    currentIndex.value = index;
  }

  final List screens = [
    const HomeScreen(),
    MuslimScreen(),
    HomeScreen(),
    // HomeScreen(),
  ];
}
