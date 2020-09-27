import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; //formateo hora
import 'package:firebase_core/firebase_core.dart';

File image;
String filename;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Add Medicines',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyAddPage(),
    );
  }
}

class CommonThings {
  static Size size;
}

class MyAddPage extends StatefulWidget {
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
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

  void createData() async {
    DateTime now = DateTime.now();
    String nuevoformato = DateFormat('kk:mm:ss:MMMMd').format(now);
    var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
    var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

    final StorageReference ref =
        FirebaseStorage.instance.ref().child(fullImageName);
    final StorageUploadTask task = ref.putFile(image);

    var part1 =
        'https://firebasestorage.googleapis.com/v0/b/enteritem.appspot.com/o/';

    var fullPathImage = part1 + fullImageName2;
    print(fullPathImage);

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('medicines').add({
        'disease_name': '$name',
        'tablets_name': '$recipe',
        'image': '$fullPathImage'
      });
      setState(() => id = ref.documentID);
      Navigator.of(context).pop(); //regrese a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicines'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(10.0),
                      child: image == null ? Text('Add') : Image.file(image),
                    ),
                    Divider(),
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
                SizedBox(height: 50.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the medicine category',
                    fillColor: Colors.white,
                    filled: true,
                    //when enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                  ),
                  validator: (val) =>
                      val.isEmpty ? "Enter the items to be added" : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the medicine category',
                    fillColor: Colors.white,
                    filled: true,
                    //when enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                  ),
                  validator: (val) =>
                      val.isEmpty ? "Enter the items to be added" : null,
                  onChanged: (val) {
                    setState(() => recipe = val);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  createData();
                  showAlertDialog(context);
                },
                child: Text('Add Items', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
//              RaisedButton(
//                onPressed: id != null ? readData : null,
//                child: Text('Read', style: TextStyle(color: Colors.white)),
//                color: Colors.blue,
//              ),
            ],
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Succesfully Added!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
