import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("tryout")),
      body: new Container(
        child: Text("Welcome to flutter"),
      ),
      drawer: Drawer(
        elevation: 15.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Roch Danistan'),
              accountEmail: Text('rochdanistan123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              title: Text('All Inbox'),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text('Primary'),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
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
