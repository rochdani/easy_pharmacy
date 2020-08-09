import 'package:flutter/material.dart';
import 'package:loginapp/models/medicine.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/providers/product_provider.dart';

class EditMedicine extends StatefulWidget {
  final Medicine medicine;

  EditMedicine([this.medicine]);
  @override
  _EditMedicineState createState() => _EditMedicineState();
}

class logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/one.jpg');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
    );
  }
}

class _EditMedicineState extends State<EditMedicine> {
  final medicineNameController = TextEditingController();
  final medicineCategoryController = TextEditingController();

  @override
  void dispose() {
    medicineNameController.dispose();
    medicineCategoryController.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Succesfully Done!"),
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

  List<Widget> buttonChange() {
    final medicineProvider = Provider.of<MedicineProvider>(context);
    if (widget.medicine == null) {
      return [
        new RaisedButton(
          child: Text('Add Items', style: TextStyle(color: Colors.white)),
          color: Colors.green,
          onPressed: () {
            medicineProvider.saveMedicine();
            showAlertDialog(context);
            // Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        new RaisedButton(
          child: Text('Update', style: TextStyle(color: Colors.blueGrey)),
          onPressed: () {
            medicineProvider.saveMedicine();
            showAlertDialog(context);
            //   Navigator.pop(context);
          },
        ),
        RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text('Delete', style: TextStyle(color: Colors.white)),
          onPressed: () {
            medicineProvider.removeProduct(widget.medicine.id);
            showAlertDialog(context);
            // Navigator.of(context).pop();
          },
        ),
      ];
    }
  }

  @override
  void initState() {
    try {
      if (widget.medicine == null) {
        //new record
        medicineNameController.text = "";
        medicineCategoryController.text = "";

        new Future.delayed(Duration.zero, () {
          final medicineProvider =
              Provider.of<MedicineProvider>(context, listen: false);
          medicineProvider.loadValues(Medicine());
        });
      } else {
        //update the controller
        medicineNameController.text = widget.medicine.medicineName;
        medicineCategoryController.text = widget.medicine.category;

        //new future method is to get the context
        //update the state
        new Future.delayed(Duration.zero, () {
          final medicineProvider =
              Provider.of<MedicineProvider>(context, listen: false);
          medicineProvider.loadValues(widget.medicine);
        });
      }
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<MedicineProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            logo(),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'Add Items ',
                  style: TextStyle(
                    height: 3.0,
                    fontSize: 18.2,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Medicine Name',
                fillColor: Colors.white,
                filled: true,
                //when enabled
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
              ),
              controller: medicineNameController,
              onChanged: (value) {
                medicineProvider.changeName(value);
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Medicine Category',
                fillColor: Colors.white,
                filled: true,
                //when enabled
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
              ),
              controller: medicineCategoryController,
              onChanged: (value) => medicineProvider.changeCategory(value),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttonChange(),
            ),
            //    buttonChange(),

//            RaisedButton(
//              child: Text('Save'),
//              onPressed: () {
//                medicineProvider.saveMedicine();
//                Navigator.pop(context);
//              },
//            ),
//            RaisedButton(
//              color: Colors.red,
//              textColor: Colors.white,
//              child: Text('Delete'),
//              onPressed: () {
//                medicineProvider.removeProduct(widget.medicine.id);
//                Navigator.of(context).pop();
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
