import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_me/database.dart';
import 'package:flutter/material.dart';

class calorie extends StatefulWidget {
  
   calorie({ Key? key }) : super(key: key);

  @override
  _calorieState createState() => _calorieState();
}

class _calorieState extends State<calorie> {
  double weight=0,height=0;
  final weightcontroller=TextEditingController();
  final agecontroller=TextEditingController();
  final heightcontroller=TextEditingController();

  int calorie=0,age=0;
  String gender='', activity='Sedentary:little or no excercise';

  Color maleiconColor=Colors.white;
  Color femaleiconColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    void showCal(){
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
                      "Your daily calorie intake to maintain your weight is around $calorie cals."'\n''\n''\n'
                      "For mild weight loss your daily calorie intake should be around ${calorie-250}cals."'\n''\n''\n'
                      "For moderate weight loss your daily calorie intake should be ${calorie-500}cals."'/n''\n''\n'
                      "For vigorous weight loss (highly risky and not at all recommended) your daily calorie intake should be ${calorie-1000}cals."'/n''\n''\n',
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
                    databasebase(uid: FirebaseAuth.instance.currentUser!.uid).updateCal(calorie);
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
                        style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
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
                        keyboardType: TextInputType.numberWithOptions(decimal: false),
                        onFieldSubmitted: (value){
                          age=double.parse(value).round();
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
                          child: Center(child: Text("Activity per week",
                            style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                        ),
                         
                        DropdownButton<String>( 
                          dropdownColor: Color(0xFF1D1E33),
                            value: activity,                          
                            elevation: 16,
                            style: const TextStyle(color: Colors.redAccent,letterSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: ( newValue) {
                              setState(() {
                                 activity = newValue!;
                                 print(activity);
                              });
                            },
                           items: <String>[
                             "Sedentary:little or no excercise",
                             "Light:1-3 times excercise",
                             "Moderate:4-5 times excercise",
                             "Active:daily or intense excercise 3-4 times",
                             "Very active:intense excercise 6-7 times",
                             "Extra active: daily intense excercise"
                             ].map<DropdownMenuItem<String>>((String res) {
                               return DropdownMenuItem<String>(
                                 value: res,
                                 child: Center(child: Text(res,style:TextStyle(color:Colors.redAccent,letterSpacing: 0.5),)),
                               );
                             }).toList(),
                                                        
                        )
                      ]
                    )
                     ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                        child: Center(child: Text("Height",
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
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                          controller: heightcontroller,
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
                        child: Center(child: Text("Weight",
                        style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                      ),
                       Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("kg",
                          style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0,bottom: 25),
                        child: TextFormField(
                          style: TextStyle(color: Colors.redAccent),
                          textInputAction: TextInputAction.done,
                          controller: weightcontroller,
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
                       calcalc();
                       showCal();
                     },
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.calculate),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'CALCALC',
                     )
                 ),
                  Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed:(){
                      clearAll();

                     },
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.delete_forever),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'CALDEL',
                     )
                 ),
               
              ],
            ),
          )
        ]
        ));
  }

  calcalc() {
    if(gender=='male')
    {
      calorie=((10*weight) + (6.25*height) - (5*age) + 5).round();
      if(activity=='Light:1-3 times excercise')
      calorie=(calorie*1.15).round();
      else if(activity=='Moderate:4-5 times excercise')
      calorie=(calorie*1.30).round();
      if(activity=='Active:daily or intense excercise 3-4 times')
      calorie=(calorie*1.45).round();
      if(activity=='Very active:intense excercise 6-7 times')
      calorie=(calorie*1.60).round();
      if(activity=='Extra active: daily intense excercise')
      calorie=(calorie*1.75).round();
    }
    else if(gender=='female')
    {
      calorie=((10 * weight) + (6.25 * height) - (5 * age) - 161).round();
      if(activity=='Light:1-3 times excercise')
      calorie=(calorie*1.15).round();
      else if(activity=='Moderate:4-5 times excercise')
      calorie=(calorie*1.30).round();
      if(activity=='Active:daily or intense excercise 3-4 times')
      calorie=(calorie*1.45).round();
      if(activity=='Very active:intense excercise 6-7 times')
      calorie=(calorie*1.60).round();
      if(activity=='Extra active: daily intense excercise')
      calorie=(calorie*1.75).round();

    }
  }

  clearAll() {
                 weightcontroller.clear();
                 heightcontroller.clear();
                 agecontroller.clear();
                 femaleiconColor=Colors.white;
                 maleiconColor=Colors.white;
                 activity='Sedentary:little or no excercise';
  }
}