// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/registration.dart';
import 'package:flutter/material.dart';
import 'login.dart';


  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp() : super();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
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
      home:Builder(
        builder: (context) => Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
            children: <Widget>[
            Image.asset(
              "assets/images/FitMe.jpg",
              height:double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )
        ,Padding(
          padding: const EdgeInsets.only(top:200.0),
          child: Container(
            child: ListView(
              
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => register())
                         );
                      },
                       child: Text('Register')
                       ),
                    ),
                  ),
                ),
                 Center(
                   child: Container(
                     height: 50,
                     width: 300,
                     child: Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: ElevatedButton(onPressed: (){
                         Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => login())
                         );
                       },
                       child: Text('Login')
                       ),
                     ),
                   ),
                 ),
              ]),),
        )
            ],
          ),
        ),
    ) 
     
        
    );
  }


}

