import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; //formateo hora

File image;
String filename;

class MyUpdatePage extends StatefulWidget {
  final DocumentSnapshot ds;
  MyUpdatePage({this.ds});
  @override
  _MyUpdatePageState createState() => _MyUpdatePageState();
}

class _MyUpdatePageState extends State<MyUpdatePage> {
  String productImage;
  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String recipe;

  pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    recipeInputController =
        new TextEditingController(text: widget.ds.data["tablets_name"]);
    nameInputController =
        new TextEditingController(text: widget.ds.data["disease_name"]);
    productImage = widget.ds.data["image"]; //nuevo
    print(productImage); //nuevo
  }

  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('medicines')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      // print(e);
    });
  }

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("medicines").getDocuments();
    // print();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    getPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Medicines'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      height: 150.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null ? Text('Add') : Image.file(image),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.2),
                      child: new Container(
                        height: 150.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        padding: new EdgeInsets.all(5.0),
                        child: productImage == ''
                            ? Text('Edit')
                            : Image.network(productImage + '?alt=media'),
                      ),
                    ),
                    Row(
                      children: [
                        Divider(),
                      ],
                    ),
                    new IconButton(
                        color: Colors.blueAccent,
                        icon: new Icon(
                          Icons.camera_alt,
                          size: 60,
                        ),
                        onPressed: pickerCam),
                    Divider(),
                    new IconButton(
                        color: Colors.blueAccent,
                        icon: new Icon(
                          Icons.image,
                          size: 60,
                        ),
                        onPressed: pickerGallery),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: TextFormField(
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    controller: nameInputController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'disease_name',
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    onSaved: (value) => name = value,
                  ),
                ),
                Container(
                  child: TextFormField(
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    controller: recipeInputController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'tablets_name',
                      fillColor: Colors.blueGrey[400],
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some recipe';
                      }
                    },
                    onSaved: (value) => recipe = value,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Update',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  DateTime now = DateTime.now();
                  String nuevoformato =
                      DateFormat('kk:mm:ss:MMMMd').format(now);
                  var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
                  var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

                  final StorageReference ref =
                      FirebaseStorage.instance.ref().child(fullImageName);
                  final StorageUploadTask task = ref.putFile(image);

                  var part1 =
                      'https://firebasestorage.googleapis.com/v0/b/enteritem.appspot.com/o/'; //esto cambia segun su firestore

                  var fullPathImage = part1 + fullImageName2;
                  print(fullPathImage);
                  Firestore.instance
                      .collection('medicines')
                      .document(widget.ds.documentID)
                      .updateData({
                    'disease_name': nameInputController.text,
                    'tablets_name': recipeInputController.text,
                    'image': '$fullPathImage'
                  });
                  Navigator.of(context).pop(); //regrese a la pantalla anterior
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Colors.black54,
              ),
            ],
          )
        ],
      ),
    );
  }
}
