import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/calorie.dart';
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
          
           bottom: TabBar(tabs: 
           [
             Text("BMI"),
            Text("Fat %"),
             Text("Calorie Intake")
           ],
         indicatorColor: Colors.redAccent),
           title: Center(child: Text("FitMe",
           style: TextStyle(color: Colors.redAccent),)),
         ),
         drawer: Drawer(
           child: Column(
             children: [
               DrawerHeader(child: 
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image(image: NetworkImage('${FirebaseAuth.instance.currentUser!.photoURL}'),
                     height: 100,
                     width: 100,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Hi ${FirebaseAuth.instance.currentUser!.displayName}'),
                   )
                 ],
               )
               ),
               ListView(
                 children: [
                   ListTile()
                 ],
               )
             ],
           ),
           
         ),
         body: TabBarView(children: [
           BMI(),
           fat(),
           calorie(),
         ],)
         ),
         ),
    );
  }
}