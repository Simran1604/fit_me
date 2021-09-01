import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fit_me/authentication.dart';


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
final inputController=TextEditingController();
String email='',password='';
bool spinner=false;
  
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
                   Flexible(
                       child: Hero(
                         tag:'main',
                         child: Image(image: AssetImage('assets/images/FitMe_Logo.jpg'))),
                     ),
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
                         controller: inputController,
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
               padding: const EdgeInsets.only(left:8.0,right: 8,top: 4),
               child: Container(
                 height:100,
                 width:110,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left:8,right:8),
                       child: Text("Enter password",
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:4.0,left: 8,right: 8),
                       child: TextFormField(
                         controller: inputController,
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
             )
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
                                  onPressed:()async {                                            
                                    try {
                                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                            email: email,
                                            password: password
                                          );
                                          if(userCredential!=null)
                                          {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                            backgroundColor: Colors.redAccent,
                                            content: Text("Login Successful"))
                                          ) ;
                                           Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>tabbar()));
                                                }
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            setState(() {
                                            spinner=false;
                                          });
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                  authentication.customSnackBar(
                                                    content:
                                                        'No user found for that email.',
                                                  ),
                                                );
                                          } else if (e.code == 'wrong-password') {
      
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                  authentication.customSnackBar(
                                                    content:
                                                        'Wrong password provided for that user.',
                                                  ),
                                                );
                                          }
                                        }
                                      } ,
                                  child: Text("Login")
                                ),
                              )),
                            ),
                          
                        ),
                      ),
                  )]
               ),
             )
              ]
              ),
        ),
    );
  }
}