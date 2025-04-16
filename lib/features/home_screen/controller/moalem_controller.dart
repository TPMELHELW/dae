import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/repository/home_repository.dart';
import 'package:get/get.dart';

class MoalemController extends GetxController {
  static MoalemController get instance => Get.find<MoalemController>();

  final HomeRepository _homeRepository = Get.find<HomeRepository>();

  final List<NewMuslimModel> muslimsData = [];

  late Rx<StatusRequest> statusRequest;

  Future<void> getNonActiveMuslims() async {
    try {
      statusRequest.value = StatusRequest.loading;
      update();
      final data = await _homeRepository.getNonActiveMuslims();
      for (var item in data.docs) {
        muslimsData.add(NewMuslimModel.fromSnapshot(item));
      }
      statusRequest.value = StatusRequest.success;
      update();
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
      statusRequest.value = StatusRequest.serverFailure;
    }
  }

  Future<void> addMuslimToMoalem(String muslimId) async {
    try {
      statusRequest.value = StatusRequest.loading;
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      await _homeRepository.addMuslimToMoalem(muslimId);
      muslimsData.removeWhere((item) => item.id == muslimId);
      update();
      statusRequest.value = StatusRequest.success;
      showSuccessSnackbar('Success', 'تم اضافه المسلم بنجاح');
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;

      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.init.obs;
    getNonActiveMuslims();
    super.onInit();
  }
}
