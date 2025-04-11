import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();

  late TextEditingController name, age, number, email, primaryLang, notes;

  final List<String> genderItems = ['ّذكر', 'أنثي'];
  final List<String> periodItems = ["شهر", "اقل من شهر"];
  final List<String> countryItems = ["مصر", "تركيا"];
  final List<String> wayItems = ['دعوة ذاتية', 'Islam Port', 'Islam Connect'];
  final List<String> previousReligionItems = ['يهودي', 'مسيحي', "ملحد", "غيره"];
  final List<String> typeOfMuslimItems = ["مسلم عادي", "محب للعلم"];
  final HomeRepository _homeRepository = Get.put(HomeRepository());
  final NavigationController controller = Get.find<NavigationController>();
  late Rx<StatusRequest> statusRequest;
  bool isEdit = false;
  late String gender, period, country, way, previousReligion, typeOfMuslim;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> editFormState = GlobalKey<FormState>();

  Future<void> enterNewMuslim() async {
    try {
      if (!formState.currentState!.validate()) {
        return;
      }

      statusRequest.value = StatusRequest.loading;
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      final now = DateTime.now();
      final stringDate = DateFormat('dd/MM/yy').format(now).toString();
      final NewMuslimModel newMuslimData = NewMuslimModel(
        gender: gender,
        daeaId: controller.userData.value!.id,
        country: country,
        name: name.text.trim(),
        age: age.text.trim(),
        period: period,
        number: number.text.trim(),
        email: email.text.trim(),
        primaryLang: primaryLang.text.trim(),
        way: way,
        previousReligion: previousReligion,
        typeOfMuslim: typeOfMuslim,
        lastUpdate: stringDate,
        lessons: [],
      );

      await _homeRepository.enterNewMuslim(newMuslimData);
      statusRequest.value = StatusRequest.success;
      clearAllFields();
      showSuccessSnackbar('Success', 'تم اضافه المسلم بنجاح');
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;

      showErrorSnackbar('Error', e.toString());
    }
  }

  void clearAllFields() {
    name.clear();
    age.clear();
    email.clear();
    notes.clear();
    number.clear();
    primaryLang.clear();
  }

  Future<void> editMuslimInf(docId) async {
    try {
      if (!editFormState.currentState!.validate()) {
        return;
      }

      statusRequest.value = StatusRequest.loading;
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      final now = DateTime.now();
      final stringDate = DateFormat('dd/MM/yy').format(now).toString();

      final NewMuslimModel newMuslimData = NewMuslimModel(
        gender: gender,
        daeaId: controller.userData.value!.id,
        country: country,
        name: name.text.trim(),
        age: age.text.trim(),
        period: period,
        number: number.text.trim(),
        email: email.text.trim(),
        primaryLang: primaryLang.text.trim(),
        way: way,
        previousReligion: previousReligion,
        typeOfMuslim: typeOfMuslim,
        lastUpdate: stringDate,
        lessons: [],
      );

      await _homeRepository.editMuslimInf(docId, newMuslimData);

      statusRequest.value = StatusRequest.success;
      Get.offNamed(AppRoutes.home);
      showSuccessSnackbar('Success', 'تم التعديل بنجاح');
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    age = TextEditingController();
    number = TextEditingController();
    email = TextEditingController();
    primaryLang = TextEditingController();
    notes = TextEditingController();
    gender = genderItems[0];
    period = periodItems[0];
    country = countryItems[0];
    way = wayItems[0];
    previousReligion = previousReligionItems[0];
    typeOfMuslim = typeOfMuslimItems[0];
    statusRequest = StatusRequest.init.obs;
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    age.dispose();
    number.dispose();
    email.dispose();
    primaryLang.dispose();
    notes.dispose();
    super.onClose();
  }
}
