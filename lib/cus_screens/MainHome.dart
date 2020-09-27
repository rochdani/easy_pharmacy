import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:loginapp/admin_screens/manage_profile.dart';
import 'package:loginapp/cus_screens/camera.dart';
import 'package:loginapp/cus_screens/consult_doctor.dart';
import 'package:loginapp/cus_screens/MenuItems.dart';
import 'package:loginapp/cus_screens/instructions.dart';
import 'package:loginapp/cus_screens/profile.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  //GlobalKey _bottomNavigationKey = GlobalKey();

  final _pageOption = [
    HomeScreen(),
    ConsultDoctor(),
    MyApp(),
    Instructions(),
    ManageProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        //key: _bottomNavigationKey,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.add_shopping_cart, size: 30),
          Icon(Icons.phone_in_talk, size: 30),
          Icon(Icons.camera_alt, size: 30),
          Icon(Icons.help_outline, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],

        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],

//        body: Container(
//          color: Colors.blueAccent,
//          child: Center(
//            child: Column(
//              children: <Widget>[
//                Text(_page.toString(), textScaleFactor: 10.0),
//                RaisedButton(
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => MyApp()),
//                    );
//                  },
//                )
//              ],
//            ),
//          ),
//        )
    );
  }
}
