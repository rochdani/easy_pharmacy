import 'package:flutter/material.dart';

class StayPhysicallyActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthyAtHome - Physical activity'),
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
                        image: AssetImage('images/exercise.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop))),
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
                      padding: const EdgeInsets.fromLTRB(160.0, 0.0, 0.0, 0.0),
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
                      padding: const EdgeInsets.fromLTRB(160.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Active',
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
                        image: AssetImage('images/StayPhysicallyActive1.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'The COVID-19 pandemic means that many of us are staying at home  and sitting down more than we usually do. It’s hard for a lot of us to do the sort of exercise we normally do. It’s even harder for people who don’t usually do a lot of physical exercise.',
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
                        image: AssetImage('images/StayPhysicallyActive2.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'But at a time like this, it’s very important for people of all ages and abilities to be as active as possible. Remember - Just taking a short break from sitting, by doing 3-4 minutes of light intensity physical movement, such as walking or stretching, will help ease your muscles and improve blood circulation and muscle activity.',
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
                        image: AssetImage('images/StayPhysicallyActive3.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'Regular physical activity benefits both the body and mind. It can reduce high blood pressure, help manage weight and reduce the risk of heart disease, stroke, type 2 diabetes, and various cancers - all conditions that can increase susceptibility to COVID-19.',
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
                        image: AssetImage('images/StayPhysicallyActive4.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'It also improves bone and muscle strength and increases balance, flexibility and fitness. For older people, activities that improve balance help to prevent falls and injuries.',
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
                        image: AssetImage('images/StayPhysicallyActive5.jpg'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 350.0, 0.0),
                      child: Container(
                        //color: Colors.white70,
                        height: 500,
                        width: 300,
                        child: Text(
                          'Regular physical activity can help give our days a routine and be a way to stay in contact with family and friends. It’s also good for our mental health - reducing the risk of depression, cognitive decline and delay the onset of dementia - and improve overall feelings',
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
