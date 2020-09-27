import 'package:flutter/material.dart';
import 'package:loginapp/cus_screens/HealthyDiet.dart';
import 'package:loginapp/cus_screens/HealthyParenting.dart';
import 'package:loginapp/cus_screens/MentalHealth.dart';
import 'package:loginapp/cus_screens/StayPhysicallyActive.dart';

void main() {
  runApp(MaterialApp(
    home: Instructions(),
  ));
}

class Instructions extends StatefulWidget {
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips for Covid-19'),
        centerTitle: true,
        //backgroundColor: Colors.cyan[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.dstATop))),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('images/exercise.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.dstATop))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Stay',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Physically',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(160.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 130.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(260.0, 0.0, 0.0, 0.0),
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StayPhysicallyActive()),
                            );
                          },
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('images/diet2.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.dstATop))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 200.0, 0.0),
                        child: Text(
                          'Healthy',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 160.0, 0.0),
                        child: Text(
                          'Diet',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 250.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 260.0, 0.0),
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyDiet()),
                            );
                          },
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('images/healthyParenting.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.dstATop))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 200.0, 0.0),
                        child: Text(
                          'Healthy',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 120.0, 0.0),
                        child: Text(
                          'Parenting',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 260.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(280.0, 0.0, 0.0, 0.0),
                        child: FloatingActionButton(
                          heroTag: "btn3",
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyParenting()),
                            );
                          },
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('images/mentalHealth.jpeg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.dstATop))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Mental',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Health',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 40,
                            fontFamily: 'Piedra',
                          ),
                        ),
                      ),
                      SizedBox(height: 250.0),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 260.0, 0.0),
                        child: FloatingActionButton(
                          heroTag: "btn4",
                          backgroundColor: Colors.blueGrey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MentalHealth()),
                            );
                          },
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
