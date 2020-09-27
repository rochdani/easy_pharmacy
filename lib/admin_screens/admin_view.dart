import 'package:loginapp/cus_screens/edit_medicine.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/providers/product_provider.dart';
import 'package:loginapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/medicine.dart';

class AdminView extends StatelessWidget {
  final bool isThreeLine = true;
  final AuthService _auth = AuthService();

  void _signedOut() async {
    try {
      await _auth.signOut();
      //onSignedOut();
    } catch (e) {
      print(e);
    }
  }

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
            ),
            IconButton(
              icon: Icon(Icons.verified_user),
              onPressed: () {
                _signedOut();
              },
            ),
          ],
        ),
        //body
        body: (medicine != null)
            //  ? ListView.separated( if not card and list title then use separated
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: medicine.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset('images/15.jpeg'),
                      title: Text(medicine[index].medicineName != null
                          ? medicine[index].medicineName
                          : ''),
                      subtitle: Text(medicine[index].category != null
                          ? medicine[index].category
                          : ''),
                      isThreeLine: true,
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditMedicine(medicine[index])));
                      },
                    ),
                  );
                },
//                separatorBuilder: (context, index) {  // when use separator it must be used
//                  return Divider();
//                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
