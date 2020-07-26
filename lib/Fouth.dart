import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/Update.dart';

class Fouth extends StatefulWidget{

  @override
  FouthState createState() {
    return FouthState();
  }
}

class FouthState extends State<Fouth> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'medicineCategory: ${doc.data['medicineCategory']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'medicineName: ${doc.data['medicineName']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'medicinePrice: ${doc.data['medicinePrice']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Update())),
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          StreamBuilder<QuerySnapshot>(
            stream: db.collection('CRUD').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }



  void readData() async {
    DocumentSnapshot snapshot = await db.collection('CRUD').document(id).get();
    //print(snapshot.data['medicineCategory']);
  }

  void updateData(DocumentSnapshot doc,newValues) async {
    await db.collection('CRUD').document(doc.documentID).updateData(newValues).catchError((e){
      print(e);
    });
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).delete();
    setState(() => id = null);
  }

//  String randomTodo() {
//    final randomNumber = Random().nextInt(4);
//    String todo;
//    switch (randomNumber) {
//      case 1:
//        todo = 'Like and subscribe 💩';
//        break;
//      case 2:
//        todo = 'Twitter @robertbrunhage 🤣';
//        break;
//      case 3:
//        todo = 'Patreon in the description 🤗';
//        break;
//      default:
//        todo = 'Leave a comment 🤓';
//        break;
//    }
//    return todo;
//  }
}