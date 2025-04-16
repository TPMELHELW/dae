import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/muslim/models/lessons_model.dart';
import 'package:dae/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MuslimsController extends GetxController {
  static MuslimsController get instance => Get.find<MuslimsController>();
  final HomeRepository homeRepository = Get.find<HomeRepository>();
  final HomeController homeController = Get.find<HomeController>();
  late TextEditingController lesson;
  late String level, status, period;

  final List<String> levelItems = ['الاول', "الثاني", "الثالت"];
  final List<String> statusItems = ["تاخر", "تقدم"];
  final List<String> periodItems = ['شهر'];

  final NavigationController navigationController =
      Get.find<NavigationController>();
  late Rx<StatusRequest> statusRequest;
  List<NewMuslimModel> muslimsData = <NewMuslimModel>[].obs;

  Stream<List<NewMuslimModel>> getMuslimsData() async* {
    statusRequest.value = StatusRequest.loading;

    if (navigationController.userData.value == null) {
      await navigationController.loadUserData();
    }

    // if (navigationController.userData.value == null) {
    //   statusRequest.value = StatusRequest.serverFailure;
    //   yield [];
    //   return;
    // }

    final bool isDaea = navigationController.userData.value!.isDaea;
    yield* homeRepository.fetchMuslimsDataDaeah(isDaea).map((snapshot) {
      final mm =
          snapshot.docs.map((doc) => NewMuslimModel.fromSnapshot(doc)).toList();
      muslimsData = mm;
      statusRequest.value = StatusRequest.success;
      return mm;
    });
  }

  void setValues(NewMuslimModel muslimData) {
    homeController.name.text = muslimData.name;
    homeController.age.text = muslimData.age;
    homeController.number.text = muslimData.number;
    homeController.email.text = muslimData.email;
    homeController.primaryLang.text = muslimData.primaryLang;
  }

  Future<void> saveLesson(String docId) async {
    try {
      statusRequest.value = StatusRequest.loading;

      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      final now = DateTime.now();
      final stringDate = DateFormat('dd/MM/yy').format(now).toString();

      final data = LessonsModel(
        level: level,
        status: status,
        period: period,
        lesson: lesson.text,
        time: stringDate,
      );
      await homeRepository.saveLesson(docId, data);
      update();
      statusRequest.value = StatusRequest.success;
      showSuccessSnackbar('Success', 'تم اضافه الدرس بنجاح');
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;

      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() async {
    statusRequest = StatusRequest.init.obs;
    level = levelItems[0];
    status = statusItems[0];
    period = periodItems[0];
    lesson = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    lesson.dispose();
    super.onClose();
  }
}
