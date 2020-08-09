import 'package:flutter/material.dart';
import 'package:loginapp/models/medicine.dart';
import 'package:loginapp/services/firestore_services.dart';
import 'package:uuid/uuid.dart';

class MedicineProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _id;
  String _medicineName;
  String _category;
  String _image;
  var uuid = Uuid();

  //getters
  String get medicineName => _medicineName;
  String get category => _category;
  String get image => _image;

  //setters
  changeName(String value) {
    try {
      _medicineName = value;
      notifyListeners(); //those listening
    } catch (e) {
      print(e.toString());
    }
  }

  changeCategory(String value) {
    try {
      _category = value;
      notifyListeners(); //those listening
    } catch (e) {
      print(e.toString());
    }
  }

  saveMedicine() {
    //print("$medicineName, $category");
    try {
      if (_id == null) {
        var newMedicine = Medicine(
            medicineName: medicineName, category: category, id: uuid.v4());
        firestoreService.saveMedcine(newMedicine);
      } else {
        var updateMedicine = Medicine(
            medicineName: medicineName, category: category, id: uuid.v4());
        firestoreService.saveMedcine(updateMedicine);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  loadValues(Medicine medicine) {
    try {
      _medicineName = medicine.medicineName;
      _category = medicine.category;
      _id = medicine.id;
    } catch (e) {
      print(e.toString());
    }
  }

  removeProduct(String id) {
    firestoreService.removeProduct(id);
  }
}
