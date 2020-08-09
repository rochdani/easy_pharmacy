import 'package:flutter/material.dart';
import 'package:loginapp/admin_screens/admin_home.dart';
import 'package:loginapp/cus_dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/models/User.dart';
import 'package:loginapp/login_page.dart';
import 'package:loginapp/home_page.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/shared/loading.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final databaseReference = Firestore.instance;
  final Firestore database = Firestore.instance;

  String userTypes = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return ether home or authenticate
    if (user == null) {
      return LoginPage();
    } else {
      //set state works on stateful widgets
      setState(() {
        isLoading = true;
      });
      if (isLoading) {
        readData();
        Loading();
      }

      //  readData();
      //  Loading();
      // readData(userType);
      if (userTypes == 'Admin') {
        // print("object");
        return AdminHome();
      } else {
        return CusDash();
      }
    }
  }

  readData() async {
    try {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      DocumentSnapshot snapshot = await databaseReference
          .collection('profile')
          .document(firebaseUser.uid)
          .get();
      // print(snapshot.data['userType']);
      String result = snapshot.data['userType'];
      //print(result);
      setState(() {
        this.userTypes = result;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
