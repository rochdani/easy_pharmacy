import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MentalHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthyAtHome - Mental health'),
        centerTitle: true,
        backgroundColor: Colors.cyan[700],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Container(
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage('images/mentalHealth.jpeg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop)
                    )
                ),
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
                      padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Health',
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          fontSize: 40,
                          fontFamily: 'Piedra',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 20.0, 0.0, 0.0),
              child: Container(
                height: 550,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage('images/MentalHealth1.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop)
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'As countries introduce measures to restrict movement as part of efforts to reduce the number of people infected with COVID-19, more and more of us are making huge changes to our daily routines.',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
              child: Container(
                height: 550,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage('images/MentalHealth2.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop)
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Here are tips and advice that we hope you will find useful.',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              '>> Get up and go to bed at similar times every day.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '>> Keep up with personal hygiene.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '>> Eat healthy meals at regular times.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '>> Exercise regularly.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '>> Allocate time for working and time for resting.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(
                              '>> Make time for doing things you enjoy.',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}