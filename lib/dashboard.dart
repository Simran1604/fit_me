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
        
        
        tabBarTheme: TabBarTheme(
          labelColor: Colors.redAccent
        ),
        canvasColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
         title: Text('Health Stats',textAlign: TextAlign.center,
         style: TextStyle(color: Colors.redAccent,
         fontSize: 18,letterSpacing: 1
         )
         ,),
    ),
        body: Stack(
          alignment: AlignmentDirectional.center,
            children: <Widget>[
            Image.asset(
              "assets/images/FitMe.jpg",
              height:double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              child: ListView(        
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.brown.shade800,
                        //   blurRadius: 10,
                        //   spreadRadius: 5
                        // )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      //color: Color(0xFF1D1E33).withOpacity(0.5)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("BMI",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("21.2",
                          style: TextStyle(fontSize: 20,color: Colors.redAccent,letterSpacing: 1),)),
                        ),                      
                      ],
                    ),
                    
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                     margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade800,
                          blurRadius: 10,
                          spreadRadius: 5
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("Calories",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('1256 cal',
                            style: TextStyle(color: Colors.redAccent,letterSpacing: 1,fontSize: 18),
                            
                          textAlign: TextAlign.center,
                          )
                        
                          ),
                        
              ],
          ),
                  ),
                ),]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/6,
                    width: 320,
                    decoration: BoxDecoration(
                      boxShadow: [
                          BoxShadow(
                            color: Colors.brown.shade800,
                            blurRadius: 10,
                            spreadRadius: 5
                          )
                        ],
                      borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF1D1E33)
                    ),
                    
                      child: ListView(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("Fat Percentage",
                              style: TextStyle(fontSize: 20,letterSpacing: 0.5,color: Colors.white),)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                      padding: const EdgeInsets.only(top:10.0,right: 4),
                                      child: Text("22 %",
                                      style:
                              TextStyle(color: Colors.redAccent,letterSpacing: 1,
                                      fontSize:18,
                                      fontWeight: FontWeight.bold
                                      ),
                                      ),
                                   ),
                            ],
                          ),
                        
                        ]
                        
                      ),
                  ),
                )
              ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Container(
                     margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade800,
                          blurRadius: 10,
                          spreadRadius: 5
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("Age",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                         Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("19",
                            style: TextStyle(fontSize: 18,letterSpacing: 1,color: Colors.redAccent),)),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("yrs",
                            style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                          ),
                        
              ],
          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Container(
                     margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade800,
                          blurRadius: 10,
                          spreadRadius: 5
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("Height",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                         Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("165",
                            style: TextStyle(fontSize: 18,letterSpacing: 1,color: Colors.redAccent),)),
                          ),
                       Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("cm",
                            style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                          ),
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Container(
                     margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade800,
                          blurRadius: 10,
                          spreadRadius: 5
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("Weight",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                         Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("58",
                            style: TextStyle(fontSize: 18,letterSpacing: 1,color: Colors.redAccent),)),
                          ),
                        Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Center(child: Text("kg",
                            style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                          ),
                      ]
                    ),
                  ),
                )
              ]
          ),
         
        ]
        ),
            ),]),
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
                          
                          title:Text('TABBAR',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1
                          ),)
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
      ),
      
    );
  }
}