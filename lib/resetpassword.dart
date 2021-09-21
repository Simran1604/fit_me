import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/dashboard.dart';
import 'package:fit_me/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fit_me/authentication.dart';


class resetPassword extends StatefulWidget {
  const resetPassword({ Key? key }) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {


final emailController=TextEditingController();
final passwordcontroller=TextEditingController();
String email='',password='';
bool spinner=false;
final auth =FirebaseAuth.instance;
  
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
      home: Scaffold(
          body:  Stack(
            alignment: AlignmentDirectional.center,
              children: <Widget>[
              Image.asset(
                "assets/images/FitMe.jpg",
                height:double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
             Container(
               height: MediaQuery.of(context).size.height/1.2,
               width: MediaQuery.of(context).size.width/1.2,
               child: ListView(
                 children: [
                  Hero(
                         tag:'main',
                         child: Image(image: AssetImage('assets/images/FitMe_Logo.jpg'))),
                   Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 100,
                 width: 110,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                       child: Text("Enter email",
                      ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:4.0,left: 8,right: 8),
                       child: TextFormField(
                         controller: emailController,
                        autofocus: true, 
                         decoration: InputDecoration(
                           hintText: "name@email.com"
                           ,fillColor: Colors.white
                         ),
                         keyboardType: TextInputType.emailAddress,
                         onChanged: (String value){
                           try{
                             email=value;
                           }catch(exception){
                             print(exception);
                            }
                         },
                       ),
                     )
                   ],
                 ),
               ),
             ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          height: 36.8,
                          width: 69,
                          
                            child: Scaffold(
                              backgroundColor: Colors.blue,
                              body: Builder(builder: (context)=>Center(
                                child: ElevatedButton(
                                  onPressed:(){
                                    auth.sendPasswordResetEmail(email: email);
                                    Navigator.pop(context);
                                  } ,
                                  child: Text("Reset")
                                ),
                              )),
                            ),                          
                        ),
                      ),
                  ),
                   ]
               ),
             )
              ]
              ),
        ),
    );
  }
}