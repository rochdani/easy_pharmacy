import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Update extends StatefulWidget{

  @override
  UpdateState createState() {
    return UpdateState();
  }
}


class UpdateState extends State<Update> {
  String id;
  final db = Firestore.instance;
  DocumentSnapshot doc;
  final _formKey = GlobalKey<FormState>();
  String medicineCategory;
  String medicineName;
  String medicinePrice;





  @override
  Widget build(BuildContext context ) {
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

                Row(children: <Widget>[
                  Expanded(child: Text('Update Items ', style: TextStyle(height: 3.0, fontSize: 18.2, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
                ],),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Update  medicine category',
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
                   this.medicineCategory = val;


                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Update medicine Name',
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
                    this.medicineName = val;


                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Update medicine price',
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
                    this.medicinePrice = val ;


                  },
                ),


              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed:(){ updateData(doc);
                showAlertDialog(context);

                },
                child: Text('Update Items', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),

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
      content: Text("Succesfully Updated!"),
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



  void updateData(DocumentSnapshot doc) async {


    await db.collection('CRUD').document(doc.documentID).updateData({'medicineCategory':this.medicineCategory , 'medicineName':this.medicineName ,'medicinePrice':this.medicinePrice});
  }



}