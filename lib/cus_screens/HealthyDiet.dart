import 'package:flutter/material.dart';

class HealthyDiet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthyAtHome: Healthy Diet'),
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
                        image: AssetImage('images/diet2.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 200.0, 0.0),
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
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 160.0, 0.0),
                      child: Text(
                        'Diet',
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
                        image: AssetImage('images/HealthyDiet1.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(350.0, 25.0, 0.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'Eating a healthy diet is very important during the COVID-19 pandemic. What we eat and drink can affect our body’s ability to prevent, fight and recover from infections.',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
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
                        image: AssetImage('images/HealthyDiet2.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 220.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 300,
                        width: 300,
                        child: Text(
                          'While no foods or dietary supplements can prevent or cure COVID-19 infection, healthy diets are important for supporting immune systems.',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
