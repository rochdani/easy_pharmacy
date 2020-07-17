import 'package:flutter/material.dart';
import 'package:loginapp/Third.dart';
import 'package:loginapp/auth.dart';
import 'package:loginapp/Fouth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './crud.dart';
import 'package:loginapp/Second.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget{

  String carModel;
  String carColor;

  crudMethods crudObj = crudMethods();



  HomePage({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

 



  Material MyItems (context,IconData icon,String heading,int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: new Icon(Icons.favorite), onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Second()),
                    );
                  }),
                  //text
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                      ),
                    ),
                  ),
                  //icon
//                  Material(
//
//                  color:new Color(color),
//                    borderRadius: BorderRadius.circular(24.0),
//
//                    child: Padding(
//                      padding: const  EdgeInsets.all(16.0),
//                      child: Icon(
//                        icon,
//                        color: Colors.white,
//                        size: 30.0,
//
//
//
//                      ),
//
//                    ),
//                  ),

                ],
              ),
            ],
          ),
        ),
      ),

    );

  }

  Material MyItems1 (context,IconData icon,String heading,int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: new Icon(Icons.favorite), onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Third()),
                    );
                  }),
                  //text
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(heading,
                        style: TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),

//
//
//
//                      ),
//
//                    ),
//                  ),

                ],
              ),
            ],
          ),
        ),
      ),

    );

  }

  Material MyItems2 (context,IconData icon,String heading,int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: new Icon(Icons.favorite), onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fouth()),
                    );
                  }),
                  //text
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(heading,
                        style: TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  //icon
//                  Material(
//
//                  color:new Color(color),
//                    borderRadius: BorderRadius.circular(24.0),
//
//                    child: Padding(
//                      padding: const  EdgeInsets.all(16.0),
//                      child: Icon(
//                        icon,
//                        color: Colors.white,
//                        size: 30.0,
//
//
//
//                      ),
//
//                    ),
//                  ),

                ],
              ),
            ],
          ),
        ),
      ),

    );

  }


  void  _signedOut() async{
   try{
await auth.signOut();
onSignedOut();
  }catch(e){
 print(e);
  }

}

//  Future navigateToSubPage(context) async {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
//  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
         title: new Text('Welcome'),
         actions: <Widget>[
           new FlatButton(onPressed: _signedOut, child:new Text('Logout',style: new TextStyle(fontSize: 17.0,color: Colors.white)),
           ),

         ],
       ),
//
     body: StaggeredGridView.count(crossAxisCount:2,
       crossAxisSpacing: 12.0,
       mainAxisSpacing: 12.0,
       padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
       children: <Widget>[
         MyItems(context,Icons.graphic_eq,"Medicine",0xffed622b),
         MyItems1(context,Icons.graphic_eq,"OrderItems",0xffed622b),
         MyItems2(context,Icons.graphic_eq,"ContactDoctor",0xffed622b),
         MyItems(context,Icons.graphic_eq,"Tips",0xffed622b),
       ],
       staggeredTiles: [
         StaggeredTile.extent(1, 150.0),
         StaggeredTile.extent(1, 150.0),
         StaggeredTile.extent(1, 150.0),
         StaggeredTile.extent(1, 150.0),
       ],

     ),
         );



  }
}