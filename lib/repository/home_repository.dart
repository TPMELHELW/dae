import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:get/get.dart';

class HomeRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> enterNewMuslim(NewMuslimModel muslimData) async {
    try {
      await _db.collection('Muslims').add(muslimData.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
