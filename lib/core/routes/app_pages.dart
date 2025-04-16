import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/authentication/screens/login_screen/login_screen.dart';
import 'package:dae/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:dae/features/home_screen/screens/navigation_screen.dart';
import 'package:dae/features/muslim/screens/show_account_screen.dart';
import 'package:dae/intial_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      binding: InitialBinding(),
      name: AppRoutes.home,
      page: () => const NavigationMenuScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.showAccount,
      page: () {
        final args = Get.arguments as Map;
        return ShowAccountScreen(
          isDaea: args['isDaea'],
          muslimData: args['muslimData'],
          index: args['index'],
        );
      },

      transition: Transition.cupertino,
    ),
  ];
}
