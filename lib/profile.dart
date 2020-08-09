import 'package:flutter/material.dart';
import 'package:loginapp/provider_widget.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: Provider.of(context).auth.currentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text("${snapshot.data}");
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
