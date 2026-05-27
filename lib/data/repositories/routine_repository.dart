import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evening_flow/models/routine_model.dart';

class RoutineRepository {
  final FirebaseFirestore _firestore;

  RoutineRepository(this._firestore);

  Future<List<RoutineModel>> fetchRoutines() async {
    final snapshot = await _firestore.collection('routines').get();
    return snapshot.docs.map((doc) {
      return RoutineModel.fromMap(doc.data(), doc.id);
    }).toList();
  }
}