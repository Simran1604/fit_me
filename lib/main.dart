// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/dashboard.dart';
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
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async{
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User user) {
    if (user == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>dashboard()));
    }
  });
  }
 
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
        , Container(
            child: ListView(
              children: [
                Center(
                    child: Hero(
                      tag:'main',
                      child: Image(
                            image: AssetImage('assets/images/FitMe_Logo.jpg'),
                            height: 400,                
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(child:
                  Text("New to FitMe?") 
                  ,),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:10.0,left: 10,right: 10),
                      child:OutlinedButton(onPressed: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => register())
                           );
                        },
                         child: Text('Register'),
                         style: ButtonStyle(elevation: MaterialStateProperty.all(10),
                         ),
                                          ),
                      
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(child:
                  Text("Already have an account?") 
                  ,),
                ),
                 Center(
                   child: Container(
                     height: 50,
                     width: 200,
                     child: Padding(
                       padding: const EdgeInsets.only(left:10.0,right:10,bottom:10),
                      
                         child: OutlinedButton(onPressed: (){
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
        ],
            ),),
          ])
        ),
    ) 
     
        
    );
  }


}

