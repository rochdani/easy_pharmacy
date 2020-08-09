import 'package:loginapp/cus_screens/edit_medicine.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/medicine.dart';

class ShowMedicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicine = Provider.of<List<Medicine>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Medicine'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditMedicine()));
              },
            )
          ],
        ),
        //body
        body: (medicine != null)
            ? ListView.builder(
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medicine[index].medicineName != null
                        ? medicine[index].medicineName
                        : ''),
                    trailing: Text(medicine[index].category != null
                        ? medicine[index].category
                        : ''),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditMedicine(medicine[index])));
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
