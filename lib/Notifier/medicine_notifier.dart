import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:loginapp/models/medicine.dart';

class MedicineNotifier with ChangeNotifier {
  List<Medicine> _medicineList = [];
  Medicine _currentMedicine;

  UnmodifiableListView<Medicine> get medicineList =>
      UnmodifiableListView(_medicineList);
  Medicine get currentMedicine => _currentMedicine;

  set medicineList(List<Medicine> medicineList) {
    _medicineList = medicineList;
    notifyListeners();
  }

  set currentMedicine(Medicine medicine) {
    _currentMedicine = medicine;
    notifyListeners();
  }

  addFood(Medicine medicine) {
    _medicineList.insert(0, medicine);
    notifyListeners();
  }

  deleteFood(Medicine medicine) {
    _medicineList.removeWhere((_medicine) => _medicine.id == medicine.id);
    notifyListeners();
  }
}
