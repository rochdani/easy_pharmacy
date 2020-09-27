import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/admin_screens/addpage.dart';
//import 'package:includeitem/consultas.dart';
import 'package:loginapp/admin_screens/informationPage.dart';
//import 'package:includeitem/listviewpage.dart';
import 'package:loginapp/admin_screens/updatepage.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'View Medicines',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new View(),
    );
  }
}

class CommonThings {
  static Size size;
}

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  //final _formKey = GlobalKey<FormState>();
  String name;
  String recipe;

  //create function for delete one register
  void deleteData(DocumentSnapshot doc) async {
    await db.collection('medicines').document(doc.documentID).delete();
    setState(() => id = null);
  }

  //create tha funtion navigateToDetail
  navigateToDetail(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyUpdatePage(
                  ds: ds,
                )));
  }

  //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyInfoPage(
                  ds: ds,
                )));
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Medicines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.list),
//            tooltip: 'List',
//            onPressed: () {
//              Route route = MaterialPageRoute(builder: (context) => MyListPage());
//             Navigator.push(context, route);
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: () {
//              Route route = MaterialPageRoute(builder: (context) => MyQueryPage());
//             Navigator.push(context, route);
//            },
//          ),
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("medicines").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text('"Loading...');
            }
            int length = snapshot.data.documents.length;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //two columns
                  mainAxisSpacing: 0.1, //space the card
                  childAspectRatio: 0.800, //space largo de cada card
                ),
                itemCount: length,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (_, int index) {
                  final DocumentSnapshot doc = snapshot.data.documents[index];
                  return new Container(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () => navigateToDetail(doc),
                                child: new Container(
                                  child: Image.network(
                                    '${doc.data["image"]}' + '?alt=media',
                                  ),
                                  width: 180,
                                  height: 120,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                doc.data["disease_name"],
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 25.0,
                                ),
                              ),
                              subtitle: Text(
                                doc.data["tablets_name"],
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 20.0),
                              ),
                              onTap: () => navigateToDetail(doc),
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: new Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 70,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.blueAccent,
                                        size: 40,
                                      ),
                                      onPressed: () =>
                                          deleteData(doc), //funciona
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => MyAddPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
