import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Prescription'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage('images/presc.jpeg'),
                fit: BoxFit.cover,
              ),
              //Image(image: AssetImage('assets/ambulance.jpg'),),

              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 150,
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Upload Prescription',
                          style: TextStyle(
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Divider(
                          height: 10.0,
                        ),
                        Text(
                          'Upload Your Prescription and tell us what you need, We do the rest!',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage('images/cameraa.png'),
                    height: 75,
                  ),
                  Image(
                    image: AssetImage('images/galleryy.png'),
                    height: 75,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      'Camera',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.blueAccent,
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'PRESCRIPTION GUIDE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '#Upload clear prescription images',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '#Important details should be part of valid prescription',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: AssetImage('images/upload.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
