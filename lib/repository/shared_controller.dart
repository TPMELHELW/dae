// import 'dart:convert';

// import 'package:dae/core/services/shared_preferences_services.dart';
// import 'package:dae/features/authentication/models/user_model.dart';
// import 'package:dae/repository/user_repository.dart';
// import 'package:get/get.dart';

// class SharedController extends GetxController {
//   static SharedController get instance => Get.find<SharedController>();
//   final UserRepository userRepository = Get.put(UserRepository());
//   final SharedPreferencesService _preferencesService =
//       Get.find<SharedPreferencesService>();
//   final Rx<UserModel> userData = UserModel.empty().obs;

//   Future<void> fetchUserData() async {
//     try {
//       final cred = await userRepository.getUserData();
//       userData.value = cred;
//       await _preferencesService.setString('UserData', json.encode(cred));
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   void onInit() {
//     fetchUserData();
//     super.onInit();
//   }
// }
