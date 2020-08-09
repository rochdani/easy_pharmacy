import 'package:flutter/material.dart';
import 'package:loginapp/models/User.dart';
import 'package:loginapp/providers/product_provider.dart';
import 'package:loginapp/providers/user_provider.dart';
import 'package:loginapp/services/firestore_services.dart';
import 'package:loginapp/services/auth.dart';
import 'package:loginapp/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MedicineProvider()),
        StreamProvider(create: (context) => firestoreService.getMedicine()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        StreamProvider(create: (context) => firestoreService.getProfile()),
      ],
      child: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter login',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}
