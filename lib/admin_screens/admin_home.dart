import 'package:flutter/material.dart';
import 'package:loginapp/Third.dart';
import 'package:loginapp/admin_screens/admin_view.dart';
import 'package:loginapp/admin_screens/manage_profile.dart';
import 'package:loginapp/models/medicine.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int currentPage = 0;
  final List<Widget> screens = [AdminView(), Third(), ManageProfile()];

  Widget currentScreen = AdminView();
  //backet allows to switch between pages
  final PageStorageBucket backet = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: backet, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = AdminView();
                    currentPage = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.widgets,
                        color: currentPage == 0 ? Colors.blue : Colors.grey),
                    Text(
                      'Medicine',
                      style: TextStyle(
                          color: currentPage == 0
                              ? Colors.blueAccent
                              : Colors.grey),
                    )
                  ],
                ),
                minWidth: 40,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = ManageProfile();
                    currentPage = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_shipping,
                        color: currentPage == 1 ? Colors.blue : Colors.grey),
                    Text(
                      'Add Items',
                      style: TextStyle(
                          color: currentPage == 1 ? Colors.blue : Colors.grey),
                    )
                  ],
                ),
                minWidth: 40,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = Third();
                    currentPage = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person,
                        color: currentPage == 2 ? Colors.blue : Colors.grey),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: currentPage == 2 ? Colors.blue : Colors.grey),
                    )
                  ],
                ),
                minWidth: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
