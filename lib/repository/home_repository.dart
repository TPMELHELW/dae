import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/muslim/models/lessons_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Future<void> addMuslimToMoalem(String data) async {
    try {
      await _db.collection('Muslims').doc(data).update({
        'Active': true,
        'MoalemId': auth.currentUser!.uid,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> enterNewMuslim(NewMuslimModel muslimData) async {
    try {
      final query =
          await _db
              .collection('Muslims')
              .where('Number', isEqualTo: muslimData.number)
              .limit(1)
              .get();

      if (query.docs.isEmpty) {
        final newData = await _db
            .collection('Muslims')
            .add(muslimData.toJson());
        await _db.collection('Users').doc(auth.currentUser!.uid).update({
          'Muslims': FieldValue.arrayUnion([newData.id]),
        });
      } else {
        throw ('رقم المسلم موجود بالفعل');
      }
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchMuslimsDataDaeah(
    bool isDaea,
  ) {
    try {
      print(auth.currentUser!.uid);
      final data =
          _db
              .collection('Muslims')
              .where(
                isDaea ? 'DaeaId' : 'MoalemId',
                isEqualTo: auth.currentUser!.uid,
              )
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

  Future<QuerySnapshot<Map<String, dynamic>>> getNonActiveMuslims() async {
    try {
      final data =
          await _db
              .collection('Muslims')
              .where('MoalemId', isEqualTo: '')
              .get();
      return data;
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
