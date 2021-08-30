import 'package:fit_me/fat.dart';
import 'package:fit_me/water.dart';
import 'package:flutter/material.dart';

import 'BMI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.redAccent,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.redAccent
        )
      ),
      home: DefaultTabController(length: 3, 
      child:  Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: 
        [
          Text("BMI"),
          Text("Fat %"),
          Text("Water Intake")
        ]),
        title: Center(child: Text("FitMe",
        style: TextStyle(color: Colors.redAccent),)),
      ),
      body: TabBarView(children: [
        BMI(),
        fat(),
        water(),
      ],)
      ),
      ),
    );
  }
}

