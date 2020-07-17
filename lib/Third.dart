import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Third extends StatefulWidget{

  @override
  ThirdState createState() {
    return ThirdState();
  }
}

class logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/one.jpg');
    Image image =Image(image: assetImage,width: 200.0,height: 200.0,);
    return Container(child: image,);
  }
}
class ThirdState extends State<Third> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String medicineCategory;
  String medicineName;
  String medicinePrice;

//  Card buildItem(DocumentSnapshot doc) {
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text(
//              'name: ${doc.data['name']}',
//              style: TextStyle(fontSize: 24),
//            ),
//            Text(
//              'todo: ${doc.data['todo']}',
//              style: TextStyle(fontSize: 20),
//            ),
//            SizedBox(height: 12),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                FlatButton(
//                  onPressed: () => updateData(doc),
//                  child: Text('Update todo', style: TextStyle(color: Colors.white)),
//                  color: Colors.green,
//                ),
//                SizedBox(width: 8),
//                FlatButton(
//                  onPressed: () => deleteData(doc),
//                  child: Text('Delete'),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }

//  TextFormField buildTextFormField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        border: InputBorder.none,
//        hintText: 'name',
//        fillColor: Colors.grey[300],
//        filled: true,
//      ),
//
//      validator: (value) {
//        if (value.isEmpty) {
//          return 'Please enter some text';
//        }
//      },
//
//      onSaved: (value) => name = value,
//
//
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),

        children: <Widget>[
          Form(
            key: _formKey,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                logo(),
               Row(children: <Widget>[
                 Expanded(child: Text('Add Items ', style: TextStyle(height: 3.0, fontSize: 18.2, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
               ],),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                  hintText: 'Enter the medicine category',
                    fillColor: Colors.white,
                    filled: true,
                    //when enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent,width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent,width: 2.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty? "Enter the items to be added":null,
                  onChanged: (val){
                    setState(() => medicineCategory = val);


                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the medicine Name',
                    fillColor: Colors.white,
                    filled: true,
                    //when enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent,width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent,width: 2.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty? "Enter the items name":null,
                  onChanged: (val){
                    setState(() => medicineName = val);


                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the medicine price',
                    fillColor: Colors.white,
                    filled: true,
                    //when enabled
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent,width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent,width: 2.0),
                    ),
                  ),
                  validator: (val) => val.isEmpty? "Enter the items price":null,
                  onChanged: (val){
                    setState(() => medicinePrice = val);


                  },
                ),


              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed:(){ createData();
                showAlertDialog(context);

             },
                child: Text('Add Items', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),
//          StreamBuilder<QuerySnapshot>(
//            stream: db.collection('CRUD').snapshots(),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
//              } else {
//                return SizedBox();
//              }
//            },
//          )
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

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('CRUD').add({'medicineCategory': '$medicineCategory😎','medicineName':'$medicineName','medicinePrice':'$medicinePrice'});

      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('CRUD').document(id).get();
    print(snapshot.data['medicineCategory']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).updateData({'todo': 'please 🤫'});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('CRUD').document(doc.documentID).delete();
    setState(() => id = null);
  }


}