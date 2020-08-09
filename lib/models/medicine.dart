import 'package:flutter/material.dart';

class Medicine {
  final String id;
  final String medicineName;
  final String category;
  //final String image;

  Medicine({this.medicineName, this.category, this.id});

//  Medicine.fromMap(Map<String, dynamic> data) {
//    this.id = id;
//    this.medicineName = medicineName;
//    this.category = category;
//    this.image = image;
//  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'medicineName': medicineName, 'category': category};
  }

  Medicine.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        medicineName = firestore['medicineName'],
        category = firestore['category'];
}
