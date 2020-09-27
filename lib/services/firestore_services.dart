import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/User.dart';
import 'package:loginapp/models/medicine.dart';
import 'package:loginapp/models/profile.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveMedcine(Medicine medicine) {
    return _db
        .collection('medicine')
        .document(medicine.id)
        .setData(medicine.toMap());
  }

  Stream<List<Medicine>> getMedicine() {
    return _db.collection('medicine').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Medicine.fromFirestore(document.data))
        .toList());
  }

  Stream<List<Profile>> getProfile() {
    return _db.collection('profile').snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Profile.fromFirestore(document.data))
        .toList());
  }

  Future getUser(String uid) async {
    try {
      var userData = await _db.document(uid).get();
      return Profile.fromFirestore(userData.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeProduct(String id) {
    return _db.collection('medicine').document(id).delete();
  }

  Future<List<Profile>> removeProfile(String id) {
    return _db.collection('profile').document(id).delete();
  }
}
