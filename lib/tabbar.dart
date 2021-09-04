import 'package:firebase_core/firebase_core.dart';
import 'package:fit_me/calorie.dart';
import 'package:fit_me/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/authentication.dart';

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
          labelColor: Colors.redAccent,
        ),
        canvasColor: Color(0xFF0A0E21),
      ),
         home:DefaultTabController(length: 3, 
         child:  Scaffold(
         appBar: AppBar(
          
           bottom: TabBar(tabs: 
           [
             Text("BMI",style: TextStyle(letterSpacing: 1,fontSize:14 ),),
            Text("Fat %",style: TextStyle(letterSpacing: 1,fontSize:14 ),),
             Text("Calorie Intake",style: TextStyle(letterSpacing: 1,fontSize:14 ),)
           ],
         indicatorColor: Colors.redAccent),
           title:Text("FitMe",textAlign: TextAlign.center,
           style: TextStyle(color: Colors.redAccent,fontSize: 18,letterSpacing: 1),),
         ),
         drawer:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF0A0E21),
                ),
                child: DrawerHeader(
                  child:
                      Row(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 50,
                              foregroundImage: AssetImage('assets/images/dp.jpg'),
                              
                            ),
                          ),

                          Expanded(child: Text('Hi ',style:TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 0.5))),
                          Expanded(
                              child: Text('Simran',
                              style: TextStyle(color: Colors.redAccent,fontSize: 18,letterSpacing: 0.5),),
                            ),
                          
                        ],
                      
                  ),
                ),
              ),
              Container(
                child: Column(
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.brown.shade800,
                        child: ListTile(
                          tileColor: Color(0xFF1D1E33),
                          trailing: Icon(Icons.dashboard,color: Colors.redAccent,size: 20,),
                          title:Text('DASHBOARD',style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1
                          ),)
                        ),
                        onTap: (){
                          Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => dashboard())
                                   );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.brown.shade800,
                        child: ListTile(
                          trailing: Icon(Icons.settings,color: Colors.redAccent,size: 20,),
                          tileColor: Color(0xFF1D1E33),
                          selectedTileColor: Colors.redAccent.withOpacity(0.5),
                          title:Text('SETTINGS',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1
                          ),
                          )
                        ),
                        onTap: (){
                          Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => tabbar())
                                   );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.brown.shade800,
                        child: ListTile(
                          trailing: Icon(Icons.logout,color: Colors.redAccent,size: 20,),
                          tileColor: Color(0xFF1D1E33),
                          selectedTileColor: Colors.redAccent.withOpacity(0.5),
                          title:Text('SIGNOUT',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold
                          ),
                          )
                          
                        ),
                        onTap: (){
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
                                  },
                      ),
                    ),
                  ],
                ),
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