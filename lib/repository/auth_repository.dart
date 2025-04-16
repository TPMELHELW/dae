// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final auth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(',,,,');
      return credential;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
      Get.offAllNamed(AppRoutes.login);
      // print(auth.currentUser?.uid);
    } catch (e) {
      rethrow;
    }
  }

  void redirectScreen() {
    if (auth.currentUser != null) {
      if (!auth.currentUser!.emailVerified) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser!.emailVerified) {
        final db =
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(auth.currentUser!.uid)
                .get();
        log('${auth.currentUser?.uid}');
        return db;
      } else {
        throw ('الرجاء تفعيل الايميل');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onReady() {
    redirectScreen();
    super.onReady();
  }
}
