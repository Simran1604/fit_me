
import 'package:fit_me/tabbar.dart';
import 'package:fit_me/widgets/googleSignInButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/authentication.dart';

class register extends StatefulWidget {
  const register({ Key? key }) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final inputController=TextEditingController();
  final auth=FirebaseAuth.instance;
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
                       Flexible(
                         child: Hero(
                           tag:'main',
                           child: Image(image: AssetImage('assets/images/FitMe_Logo.jpg'))),
                       ),
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
                             controller: inputController,
                             obscureText: true,
                             keyboardType: TextInputType.text,
                             decoration: InputDecoration(
                               hintText: 'name',
                               fillColor: Colors.white
                             ),
                             onChanged: (String value){
                               inputController.clear();
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
                               controller: inputController,
                               decoration: InputDecoration(
                                 hintText: "name@email.com"
                                 ,
                               ),
                               keyboardType: TextInputType.emailAddress,
                               onChanged: (String value){
                                 inputController.clear();
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
              //          Padding(padding: const EdgeInsets.all(8),
              //          child: Container(
              //             height:100,
              //             width:110,
              //             child: ListView(
              //        children: [
              //          Padding(
              //            padding: const EdgeInsets.all(8.0),
              //            child: Text("Enter username",
              //            ),
              //          ),
              //          Padding(
              //            padding: const EdgeInsets.all(8.0),
              //            child: TextFormField(
              //              keyboardType: TextInputType.text,
              //              decoration: InputDecoration(
              //                hintText: 'username',
              //                fillColor: Colors.white
              //              ),
              //              onChanged: (String value){
              //                try{
              //                  username=value;
              //                }catch(exception){
              //                  username.contains(' ');
              //                }
              //              },
              //            ),
              //          ),             
              //      ],
              //    ),
                        //  ),
                        //  ),
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
                             controller: inputController,
                             obscureText: true,
                             keyboardType: TextInputType.text,
                             decoration: InputDecoration(
                               hintText: 'password',
                               fillColor: Colors.white
                             ),
                             onChanged: (String value){
                               inputController.clear();
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
                                              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                              email: email,
                                              password: password);
                                              if(userCredential!=null)
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                backgroundColor: Colors.redAccent,
                                                content: Text("Registration Successful"))
                                              ) ;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => tabbar()));
                                              }
                                              
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