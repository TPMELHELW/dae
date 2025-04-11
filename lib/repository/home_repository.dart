import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/muslim/models/lessons_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<void> enterNewMuslim(NewMuslimModel muslimData) async {
    try {
      final query =
          await _db
              .collection('Muslims')
              .where('Number', isEqualTo: muslimData.number)
              .limit(1)
              .get();

      if (query.docs.isEmpty) {
        await _db.collection('Muslims').add(muslimData.toJson());
      } else {
        throw ('رقم المسلم موجود بالفعل');
      }
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchMuslimsData() {
    try {
      final data =
          _db
              .collection('Muslims')
              .where('DaeaId', isEqualTo: currentUser!.uid)
              .snapshots();

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editMuslimInf(String docId, NewMuslimModel data) async {
    try {
      await _db.collection('Muslims').doc(docId).set(data.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveLesson(String docId, LessonsModel data) async {
    try {
      await _db.collection('Muslims').doc(docId).update({
        'Lessons': FieldValue.arrayUnion([data.toJson()]),
      });
    } catch (e) {
      rethrow;
    }
  }
}
