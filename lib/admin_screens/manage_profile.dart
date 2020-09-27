import 'package:loginapp/cus_screens/edit_medicine.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/models/profile.dart';
import 'package:loginapp/providers/user_provider.dart';
import 'package:loginapp/services/auth.dart';
import 'package:provider/provider.dart';

class ManageProfile extends StatelessWidget {
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
    final user = Provider.of<List<Profile>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.supervised_user_circle,
                size: 30.0,
              ),
              onPressed: () {
                _signedOut();
              },
            ),
          ],
        ),
        //body
        body: (user != null)
            //  ? ListView.separated( if not card and list title then use separated
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset('images/15.jpeg'),
                      title: Text(
                          user[index].name != null ? user[index].name : ''),
                      subtitle: Text(
                          user[index].email != null ? user[index].email : ''),
                      isThreeLine: true,
                      trailing: Icon(Icons.delete),
                      onTap: () {
                        // user.removeProfile()
                        // Navigator.of(context).pop();
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
