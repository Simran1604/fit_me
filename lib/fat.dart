import 'package:fit_me/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fat extends StatefulWidget {
  const fat({ Key? key }) : super(key: key);

  @override
  _fatState createState() => _fatState();
}

class _fatState extends State<fat> {

  final neckcontroller=TextEditingController();
  final agecontroller=TextEditingController();
  final waistcontroller=TextEditingController();
  final heightcontroller=TextEditingController();

  int weight=0;
  double age=0,neck=0,waist=0,fat=0,height=0;
  String gender='';

  Color maleiconColor=Colors.white;
  Color femaleiconColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    void showFat(){
      showModalBottomSheet(context: context, builder: (context){  
             
        return Container(
          decoration: BoxDecoration(color: Color((0xFF1D1E33))),
              
          child:
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children:[Center(
                  child: Expanded(
                    child: Text(
                      "Your Body fat Percentage is $fat."'\n''\n''\n'
                      "The ideal body fat percentage chart is as follows:"'\n''\n'
                      "Women:"'\n''\n'

                      "20-40 yrs old:"'\n''\n'
                       "Underfat: under 21 percent,"'\n'
                       "Healthy: 21-33 percent,"'\n'
                       "Overweight: 33-39 percent,"'\n'
                       "Obese: Over 39 percent"'\n''\n'

                      "41-60 yrs old:"'\n''\n'
                       "Underfat: under 23 percent,"'\n'
                       "Healthy: 23-35 percent,"'\n'
                       " Overweight : 35-40 percent,"'\n'
                       "Obese: over 40 percent"'\n''\n'

                      "61-79 yrs old:"'\n''\n'
                       "Underfat: under 24 percent,"'\n'
                       "Healthy: 24-36 percent,"'\n'
                       "Overweight: 36-42 percent,"'\n'
                       "Obese: over 42 percent"'\n''\n'
                      "Men:"'\n''\n'

                      "20-40 yrs old:"'\n''\n'
                      "Underfat: under 8 percent,"'\n'
                      "Healthy: 8-19 percent,"'\n'
                      "Overweight: 19-25 percent,"'\n'
                      " Obese: over 25 percent"'\n'

                      "41-60 yrs old:"'\n''\n'
                      "Underfat: under 11 percent,"'\n'
                      "Healthy: 11-22 percent,"'\n'
                      "Overweight: 22-27 percent,"'\n'
                      "Obese: over 27 percent"'\n'

                      "61-79 yrs old:"'\n''\n'
                      "Underfat: under 13 percent,"'\n'
                      "Healthy: 13-25 percent,"'\n'
                      "Overweight: 25-30 percent,"'\n'
                      "Obese: over 30 percent"'\n''\n''\n',

                      style: TextStyle(color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 18),
                    ),
                  ),
                ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.save,color: Colors.redAccent,size: 14,),
                    onPressed: (){
                    databasebase(uid: FirebaseAuth.instance.currentUser!.uid).updatefat(fat);
                  },
                  ),
                  FloatingActionButton(onPressed:(){
                    clearAll();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.clear,color: Colors.redAccent,size: 14,),
                  )
                ],
              )
                ]
              ),
            )
        );
      });
    }
    return Scaffold(
      body: ListView(        
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
                        child: Center(child: Text("Gender",
                        style: TextStyle(fontSize: 20),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                                IconButton(onPressed:(){
                                    setState(() {
                                      if(maleiconColor==Colors.white)
                                      {
                                        gender='male';
                                        maleiconColor=Colors.redAccent;
                                        femaleiconColor=Colors.white;
                                      }
                                      else{
                                        gender='';
                                        maleiconColor=Colors.white;
                                        
                                      }
                                    });
                                  }, icon: Icon(Icons.male),iconSize: 40,color: maleiconColor,
                                  ),

                                  IconButton(onPressed:(){
                                    setState(() {
                                      if(femaleiconColor==Colors.white)
                                      {
                                        gender='female';
                                        femaleiconColor=Colors.redAccent;
                                        maleiconColor=Colors.white;
                                      }
                                      else{
                                        gender='';
                                        femaleiconColor=Colors.white;
                                      }
                                    });
                                  }, icon: Icon(Icons.female),iconSize: 40,color: femaleiconColor,
                                  ),
                          ],
                        ),
                      )
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
                        child: Center(child: Text("Age",
                        style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                          controller: agecontroller,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                        onFieldSubmitted: (value){
                          setState(() {
                            age=double.parse(value);
                          });
                        },
                        ),
                      )
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
                          child: Center(child: Text("Weight",
                            style: TextStyle(fontSize: 20,letterSpacing: 0.5,color: Colors.white),)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                    padding: const EdgeInsets.only(top:10.0,right: 4),
                                    child: Text("$weight",
                                    style:
                            TextStyle(color: Colors.redAccent,
                                    fontSize:16,
                                    fontWeight: FontWeight.bold
                                    ),
                                    ),
                                 ),

                             Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Center(child: Text("kg",
                                style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                              ),
                          ],
                        ),
                        Slider(value: weight.toDouble(), min: 0,max: 200,
                    divisions: 200,
                    inactiveColor: Colors.red.shade100,
                    activeColor: Colors.redAccent,
                    onChanged:(double value){
                      setState(() {
                        weight=value.toInt();
                      });
                    }),
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
                        child: Center(child: Text("Neck",
                        style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                      ),
                       Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right:12,bottom:20),
                        child: TextFormField(
                          controller: neckcontroller,
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: null,
                        ),
                      )
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
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0,bottom: 25),
                        child: TextFormField(
                          controller: heightcontroller,
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: null,
                        ),
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
                        child: Center(child: Text("Waist",
                        style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                      ),
                       Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0,bottom: 25),
                        child: TextFormField(
                          controller: waistcontroller,
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: null,
                        ),
                      ),
                    ]
                  ),
                ),
              )
            ]
          ),
         Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed: (){
                       fatcalc();
                       showFat();
                     },
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.calculate),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'FATCALC',
                     )
                 ),
                  Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed:(){ clearAll();},
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.delete_forever),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'FATDEL',
                     )
                 ),
               
              ],
            ),
          )
        ]
        ));
  }

  fatcalc() {
    double bmi=weight/(height*height);
    if(gender=='male')
    {
      fat=(1.20 * bmi) + (0.23 * age) - 16.2;

      databasebase(uid: FirebaseAuth.instance.currentUser!.uid).updatefat(fat);

    }else
    if(gender=='female')
    {
      fat=(1.20 * bmi) + (0.23 * age) - 5.4;
    }
  }
  clearAll() {
                 neckcontroller.clear();
                 waistcontroller.clear();
                 agecontroller.clear();
                 heightcontroller.clear();
                 femaleiconColor=Colors.white;
                 maleiconColor=Colors.white;
                 weight=0;
  }
}