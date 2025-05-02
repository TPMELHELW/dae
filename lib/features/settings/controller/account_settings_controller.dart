import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/core/services/shared_preferences_services.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/intial_binding.dart';
import 'package:dae/repository/auth_repository.dart';
import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  static AccountSettingsController get instance =>
      Get.find<AccountSettingsController>();

  late Rx<StatusRequest> statusRequest;
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final SharedPreferencesService _preferencesService =
      Get.find<SharedPreferencesService>();

  final NavigationController navigationController =
      Get.find<NavigationController>();

  Future<void> signOut() async {
    try {
      statusRequest.value = StatusRequest.loading;

      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }

      await _authRepository.logOut();
      InitialBinding().clearAllController();
      await _preferencesService.clearAll();
      statusRequest.value = StatusRequest.success;
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;

      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.init.obs;
    super.onInit();
  }
}
