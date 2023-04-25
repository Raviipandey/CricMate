import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madlab/cricapi.dart';
import 'package:madlab/homepage.dart';
import 'package:madlab/signin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_uid', user.uid);
    runApp(MyApp(isLoggedIn: true));
  } else {
    runApp(MyApp(isLoggedIn: false));
  }

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Cricket',
        key: UniqueKey(),
        theme: ThemeData(
          // Define the default Brightness and Colors
          brightness: Brightness.light,
          splashColor: Colors.black12,
          primaryColor: Colors.cyan[600],
          accentColor: Colors.cyan[600],
          // Define the default Font Family
          fontFamily: 'Raleway',
        ),
        home: isLoggedIn ? HomeScreen(key: UniqueKey()) : SignInScreen());
  }
}
