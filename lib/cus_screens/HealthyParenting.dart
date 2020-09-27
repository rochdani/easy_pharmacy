import 'package:flutter/material.dart';

class HealthyParenting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthyAtHome - Healthy parenting'),
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
                        image: AssetImage('images/healthyParenting.jpg'),
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
                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 120.0, 0.0),
                      child: Text(
                        'Parenting',
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
                        image: AssetImage('images/HealthyParenting1.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 200.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 320,
                        width: 300,
                        child: Text(
                          'Across the world, due to the spread of coronavirus disease (COVID-19), children are affected by physical distancing, quarantines and nationwide school closures.',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                        image: AssetImage('images/HealthyParenting2.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(150.0, 230.0, 0.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 300,
                        width: 300,
                        child: Text(
                          'Some children and young people may be feeling more isolated, anxious, bored and uncertain.They may feel fear, and grief, over the impact of the virus on their families.',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
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
                        image: AssetImage('images/HealthyParenting3.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 400,
                        width: 300,
                        child: Text(
                          'Watch out for resources and ideas to support parents and projects that will engage children in understanding the coronavirus, the challenges it brings to their world and what can be done to protect them.',
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
