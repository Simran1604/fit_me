import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/water.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'BMI.dart';
import 'fat.dart';

class tabbar extends StatefulWidget {
  const tabbar({ Key? key }) : super(key: key);

  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {

  final auth=FirebaseAuth.instance;
  late Firebase loggedInUser;

  @override
  void initState() {
    
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      Navigator.pop(context);
    } else {
      print('User is signed in!');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.redAccent,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.redAccent
        )
      ),
  home:   DefaultTabController(length: 3, 
         child:  Scaffold(
         appBar: AppBar(
           actions: [
             IconButton(onPressed: (){
               Navigator.pop(context);
             }, icon: Icon(Icons.logout,
             color: Colors.redAccent,))
           ],
           bottom: TabBar(tabs: 
           [
             Text("BMI"),
            Text("Fat %"),
             Text("Water Intake")
           ],
         indicatorColor: Colors.redAccent),
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