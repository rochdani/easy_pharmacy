import 'package:flutter/material.dart';
import 'package:loginapp/models/profile.dart';
import 'package:loginapp/services/firestore_services.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _uid;
  String _userType;
  String _email;
  String _name;
//  String _image;
  var uuid = Uuid();

  //getters
  String get uid => _uid;
  String get email => _email;
  String get name => _name;
  String get userType => _userType;
  // String get image => _image;

  //setters
  changeName(String value) {
    try {
      _name = value;
      notifyListeners(); //those listening
    } catch (e) {
      print(e.toString());
    }
  }

  changeEmail(String value) {
    try {
      _email = value;
      notifyListeners(); //those listening
    } catch (e) {
      print(e.toString());
    }
  }

//  saveMedicine() {
//    //print("$medicineName, $category");
//    try {
//      if (_id == null) {
//        var newMedicine = Medicine(
//            medicineName: medicineName, category: category, id: uuid.v4());
//        firestoreService.saveMedcine(newMedicine);
//      } else {
//        var updateMedicine = Medicine(
//            medicineName: medicineName, category: category, id: uuid.v4());
//        firestoreService.saveMedcine(updateMedicine);
//      }
//    } catch (e) {
//      print(e.toString());
//    }
//  }

  loadValues(Profile profile) {
    try {
      _uid = profile.uid;
      _name = profile.name;
      _email = profile.email;
      _userType = profile.userType;
    } catch (e) {
      print(e.toString());
    }
  }

  removeProfile(String uid) {
    firestoreService.removeProduct(uid);
  }
}
