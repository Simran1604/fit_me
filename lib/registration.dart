
import 'package:fit_me/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_me/database.dart';

class register extends StatefulWidget {
  const register({ Key? key }) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final auth=FirebaseAuth.instance;
  final firestore=FirebaseFirestore.instance;
  String name='',password='',email='';
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
                      scrollDirection: Axis.vertical,
                     children: [
                       Hero(
                           tag:'main',
                           child: Image(image: AssetImage('assets/images/FitMe_Logo.jpg'))),
                    Container(
                     height:100,
                     width:110,
                     child: ListView(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:8.0,left:8,right:8),
                           child: Text("Enter name",
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8,top: 4),
                           child: TextFormField(
                            controller: nameController,
                             autofocus:true,
                             textCapitalization: TextCapitalization.words,
                             
                             keyboardType: TextInputType.text,
                             decoration: InputDecoration(
                               
                               hintText: 'name',
                               fillColor: Colors.white
                             ),
                             onChanged: (String value){
                               
                               try{
                                 name=value;
                               }catch(exception){
                                 print(exception);
                               }
                             },
                           ),
                         ),             
                     ],
                 ),
                     ),
                       Container(
                          height:100,
                          width:110,
                       child: ListView(
                         children: [
                             Padding(
                             padding: const EdgeInsets.only(top:8.0,right:8,left:8),
                             child: Text("Enter email",
                            ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left:8.0,right: 8,top: 4),
                             child: TextFormField(
                               controller: emailController,
                               decoration: InputDecoration(
                                 hintText: "name@email.com"
                                 ,
                               ),
                               keyboardType: TextInputType.emailAddress,
                               onChanged: (String value){
                                 
                                 try{
                                   email=value;
                                 }catch(exception){
                                   email='';
                                 }
                               },
                             ),
                           )
                         ],
                       ),
               ),
                         Container(
                     height:100,
                     width:110,
                     child: ListView(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                           child: Text("Enter password",
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:8.0,right: 8,top: 4),
                           child: TextFormField(
                             controller: passwordController,
                             obscureText: true,
                             keyboardType: TextInputType.text,
                             decoration: InputDecoration(
                               hintText: 'password',
                               fillColor: Colors.white
                             ),
                             onChanged: (String value){
                               
                               try{
                                 password=value;
                               }catch(exception){
                                 print(exception);
                               }
                             },
                           ),
                         ),             
                     ],
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
                              width: 85,
                              
                                child: Scaffold(
                                  backgroundColor: Colors.blue,
                                  body: Builder(builder: (context)=>Center(
                                    child: ElevatedButton(
                                      onPressed:() async {
                                        try {                                        
                                              final result =await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                              email: email,
                                              password: password);
                                              databasebase(uid: result.user!.uid);
                                              nameController.clear();
                                              emailController.clear();
                                              passwordController.clear();
                                                                                            
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                backgroundColor: Colors.redAccent,
                                                content: Text("Registration Successful"))
                                              ) ;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => login()));
                                            }
                                        
                                             on FirebaseAuthException catch (e) {
                                              if (e.code == 'weak-password') {                                              
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                      authentication.customSnackBar(
                                                        content:
                                                            'The password provided is too weak.',
                                                      ),
                                                    );
                                              } else if (e.code == 'email-already-in-use') {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                      authentication.customSnackBar(
                                                        content:
                                                            'The account already exists for that email.',
                                                      ),
                                                    );
                                              }
                                            } catch (e) {
                                              print(e);
                                            }                                  
                                      } ,
                                      child: Text("Register")
                                    ),
                                  )),
                                ),
                              
                            ),
                          ),
                      ),
                       ],
                     ),
                  ),              
                    ]
                 ),
          ),
      );
  }
}