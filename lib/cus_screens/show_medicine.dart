import 'package:loginapp/cus_screens/cart.dart';
import 'package:loginapp/cus_screens/edit_medicine.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/medicine.dart';

class ShowMedicine extends StatefulWidget {
  @override
  _ShowMedicineState createState() => new _ShowMedicineState();
}

class _ShowMedicineState extends State<ShowMedicine> {
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    final medicine = Provider.of<List<Medicine>>(context);

    return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = new TextField(
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                    );
                  } else {
                    this.actionIcon = new Icon(Icons.search);
                    this.appBarTitle = new Text("AppBar Title");
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        //body
        body: (medicine != null)
            ? ListView.builder(
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset('images/15.jpeg'),
                      title: Text(medicine[index].medicineName != null
                          ? medicine[index].medicineName
                          : ''),
                      trailing: Text(medicine[index].category != null
                          ? medicine[index].category
                          : ''),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditMedicine(medicine[index])));
                      },
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
