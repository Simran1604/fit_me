import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_me/authentication.dart';



class dashboard extends StatefulWidget {
  const dashboard({ Key? key }) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  final firestore=FirebaseFirestore.instance;
  FirebaseAuth auth= FirebaseAuth.instance;
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
        appBar: AppBar(
         actions: [
           IconButton(onPressed: (){
      try{auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
      authentication.customSnackBar(
      content:
      'Signing out',
      ),
    );
      Navigator.pop(context);
    }
    catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(
      authentication.customSnackBar(
      content:
      e.toString(),
      ),
    );
    }

  }
   , icon: Icon(Icons.logout,
   color: Colors.redAccent,))
            
         ],
        ),
        body: Container(
          child: Text('Helllo people'),
        ),
        drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage('assets/images/dp.jpg'),
                            
                          ),
                        ),

                        Expanded(child: Text('Hi ',style:TextStyle(color: Colors.white,fontSize: 24))),
                        Expanded(
                          child: Text('${FirebaseAuth.instance.currentUser!.displayName}',
                          style: TextStyle(color: Colors.redAccent,fontSize: 24),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                child: ListTile(
                  title:Text('Tabbar')
                ),
                onTap: (){
                  Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => tabbar())
                           );
                },
              )
            ],
          ),
        ),
      ),
      
    );
  }
}