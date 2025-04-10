import 'package:dae/core/routes/app_pages.dart';
import 'package:dae/core/services/shared_preferences_services.dart';
import 'package:dae/core/theme/theme.dart';
import 'package:dae/firebase_options.dart';
import 'package:dae/loading_screen.dart';
import 'package:dae/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SharedPreferencesService());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepository()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: ,
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      getPages: AppPages.appPages,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: LoadingScreen(),
    );
  }
}
