import 'dart:async';

import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/core/functions/check_internet.dart';
import 'package:dae/core/functions/get_current_location.dart';
import 'package:dae/core/functions/show_snackbar.dart';
import 'package:dae/features/home_screen/models/prayer_time_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/core/services/api_services.dart';
import 'package:dae/features/home_screen/controller/navigation_controller.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/home_screen/services/home_api_services.dart';
import 'package:dae/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'http';
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
  final HomeApiService api = HomeApiService(ApiClient(client: http.Client()));
  late Rx<StatusRequest> statusRequest;
  Rx<bool> isExpanded = false.obs;
  String remainingTime = '';

  var prayerTimes = Rxn<PrayerTimeModel>();
  bool isEdit = false;
  late String gender, period, country, way, previousReligion, typeOfMuslim;
  Map<String, dynamic> nextPrayerInfo = {};
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GlobalKey<FormState> editFormState = GlobalKey<FormState>();

  Future<void> getNextPrayerInfo(PrayerTimeModel model) async {
    final now = DateTime.now();

    DateTime getTodayTime(String timeStr) {
      final parts = timeStr.split(':');
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    }

    final prayerTimes = {
      'Fajr': getTodayTime(model.fajr),
      'Sunrise': getTodayTime(model.sunrise),
      'Dhuhr': getTodayTime(model.dhuhr),
      'Asr': getTodayTime(model.asr),
      'Maghrib': getTodayTime(model.maghrib),
      'Isha': getTodayTime(model.isha),
    };

    for (var entry in prayerTimes.entries) {
      if (entry.value.isAfter(now)) {
        final duration = entry.value.difference(now);

        nextPrayerInfo = {'name': entry.key, 'duration': duration};
        return;
      }
    }

    final tomorrowFajr = getTodayTime(model.fajr).add(Duration(days: 1));
    nextPrayerInfo = {'name': 'Fajr', 'duration': tomorrowFajr.difference(now)};
  }

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
        moalemId: '',
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

  Future<void> fetchPrayerTimes(double lat, double lng) async {
    try {
      final data = await api.getPrayerTimes(lat, lng);
      prayerTimes.value = PrayerTimeModel.fromJson(data);
      getNextPrayerInfo(prayerTimes.value!);
      getRemainingTime();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getLocationAndFetchTimes() async {
    try {
      statusRequest.value = StatusRequest.loading;
      Position position = await getCurrentLocation();
      double lat = position.latitude;
      double lon = position.longitude;

      await fetchPrayerTimes(lat, lon);

      statusRequest.value = StatusRequest.success;
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  Future<void> getRemainingTime() async {
    final duration = nextPrayerInfo['duration'];
    if (duration == null || duration is! Duration) remainingTime = '--';

    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;
    if (hours > 0) {
      remainingTime = '$hours ساعة و $minutes دقيقة';
    } else {
      remainingTime = '$minutes دقيقة';
    }
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
    statusRequest = StatusRequest.init.obs;
    name = TextEditingController();
    age = TextEditingController();
    number = TextEditingController();
    email = TextEditingController();
    primaryLang = TextEditingController();
    notes = TextEditingController();
    getLocationAndFetchTimes();

    // startCountdownTimer();
    gender = genderItems[0];
    period = periodItems[0];
    country = countryItems[0];
    way = wayItems[0];
    previousReligion = previousReligionItems[0];
    typeOfMuslim = typeOfMuslimItems[0];
    // getNextPrayerInfo(prayerTimes.value!);
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
