import 'package:flutter/material.dart';
import 'package:madlab/cricapi.dart';
import 'package:madlab/homepage.dart';
import 'package:madlab/signin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cricket',
        key: UniqueKey(),
        theme: ThemeData(
          // Define the default Brightness and Colors
          brightness: Brightness.dark,
          splashColor: Colors.black12,
          primaryColor: Colors.cyan[600],
          accentColor: Colors.cyan[600],
          // Define the default Font Family
          fontFamily: 'Raleway',
        ),
        home: HomeScreen(key: UniqueKey()));
  }
}
