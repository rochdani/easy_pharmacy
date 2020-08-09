import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/models/profile.dart';

class DatabaseService {
  //collection reference
  final CollectionReference profilecollection =
      Firestore.instance.collection("profile");

  final String uid;
  DatabaseService({this.uid});

  Future updateUserData(String name, String email, String userType) async {
    return await profilecollection.document(uid).setData({
      'name': name,
      'email': email,
      'userType': userType,
    });
  }

  List<Profile> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Profile(
        email: doc.data['email'] ?? '',
        userType: doc.data['userType'] ?? 0,
        name: doc.data['name'] ?? '0',
      );
    }).toList();
  }

  Stream<List<Profile>> get profile {
    return profilecollection.snapshots().map(_brewListFromSnapshot);
  }
}
