import 'package:flutter/material.dart';
import 'package:loginapp/admin_screens/admin_home.dart';
import 'package:loginapp/cus_screens/show_medicine.dart';
import 'package:loginapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/User.dart';

class CusDash extends StatefulWidget {
  @override
  _CusDashState createState() => _CusDashState();
}

class _CusDashState extends State<CusDash> {
  final AuthService _auth = AuthService();
  final databaseReference = Firestore.instance;
  final Firestore database = Firestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser();

  readData() async {
    try {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      DocumentSnapshot snapshot = await databaseReference
          .collection('profile')
          .document(firebaseUser.uid)
          .get();
      // print(snapshot.data['userType']);
      // String result = snapshot.data['userType'];
      //print(result);

    } catch (e) {
      print(e.toString());
    }
  }

  void _signedOut() async {
    try {
      await _auth.signOut();
      //onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  getData(DocumentSnapshot doc) {
    return UserAccountsDrawerHeader(
      accountName: Text('name: ${doc.data['name']}'),
      accountEmail: Text('name: ${doc.data['email']}'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("tryout"),
        actions: <Widget>[
          new FlatButton(
            onPressed: _signedOut,
            child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white)),
          ),
        ],
      ),
      body: new Container(
        child: Text("Welcome to flutter"),
      ),
      drawer: Drawer(
        elevation: 15.0,
        child: Column(
          children: <Widget>[
//            readData(),
//            UserAccountsDrawerHeader(
//              accountName: Text('name: ${firebaseUser.['name']}'),
//              accountEmail: Text('name: ${firebaseUser.['email']}'),
//              currentAccountPicture: CircleAvatar(
//                backgroundColor: Colors.white,
//              ),
//            ),

            StreamBuilder<QuerySnapshot>(
              stream: databaseReference.collection('profile').snapshots(),
              //stream: readData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data.documents
                          .map<Widget>((doc) => getData(doc))
                          .toList());
                } else {
                  return SizedBox();
                }
              },
            ),

            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.mail),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text('View Medicine'),
              leading: Icon(Icons.local_hospital),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowMedicine()),
                );
              },
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text('Consult Doctor'),
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHome()),
                );
              },
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text('Promotion'),
              leading: Icon(Icons.local_offer),
            ),
            Divider(
              height: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
