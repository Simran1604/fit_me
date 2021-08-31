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

String email='',password='';
bool spinner=false;
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
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
               decoration: BoxDecoration(
                 color: Colors.amberAccent.shade200.withOpacity(0.6),
                 borderRadius: BorderRadius.circular(10)
               ),
               height: MediaQuery.of(context).size.height/2,
               width: MediaQuery.of(context).size.width/2,
               child: ListView(
                 children: [
                   Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 100,
                 width: 110,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Enter email",
                      ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextFormField(
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
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height:100,
                 width:110,
                 child: ListView(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Enter password",
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextFormField(
                         
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
                    padding: const EdgeInsets.all(18.0),
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