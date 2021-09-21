import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fit_me/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BMI extends StatefulWidget {
  const BMI({ Key? key }) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final heightcontroller=TextEditingController();
  final weightcontroller=TextEditingController();
  int weight=0;
  
  @override
  Widget build(BuildContext context) {
    
       void showBMI(){
      //   if(FirebaseAuth.instance.currentUser!=null)
      //   var id=FirebaseAuth.instance.currentUser!.uid;
        var result=FirebaseFirestore.instance.collection('BMI').snapshots();
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
                      "Your Body Mass Index is $result."'\n''\n''\n',
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
                      Navigator.pop(context);
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
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                     margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/4,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade800,
                          blurRadius: 10,
                          spreadRadius: 5
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33)
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Center(child: Text("Height",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5
                          ),
                          )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16,letterSpacing: 0.5),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:12.0,left: 12,right: 12),
                          child: TextFormField(
                            controller: heightcontroller,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(color: Colors.redAccent),
                          textAlign: TextAlign.center,
                          showCursor: false,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value){

                          },
                          ),
                        )
          ],
        )
      ,
            ),),)],
    ),
    Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height/4,
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
                        padding: const EdgeInsets.only(top:30.0),
                        child: Center(child: Text("Weight",
                          style: TextStyle(fontSize: 20,letterSpacing: 0.5),)),
                      ),

                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                                padding: const EdgeInsets.only(top:10,right:4.0),
                                child: Text("${weightcontroller.text}",
                                style:
                        TextStyle(color: Colors.redAccent,
                                fontSize:16,letterSpacing: 0.5,
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
                                      
                      Slider(value: weight.toDouble(), min: 0,max: 150,
                  divisions: 150,
                  inactiveColor: Colors.red.shade100,
                  activeColor: Colors.redAccent,
                  onChanged:(double value){
                    setState(() {
                      weight=value.toInt();
                    });
                  }),
                    ]
                    
                  )
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed: (){
                       getbmi();
                       showBMI();
                     },
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.calculate),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'BMICALC',
                     )
                 ),
                  Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed: clearAll(),
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.delete_forever),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'BMIDEL',
                     )
                 ),
               
              ],
            ),
          )
          ]
          );
  }

  void  getbmi() {
    double height=heightcontroller.text as double;
    double weight=weightcontroller.text as double;
    double bmi=0;

    weight*=10000;
    height*=height;
    bmi=(weight)/(height);
    
        databasebase(uid: FirebaseAuth.instance.currentUser!.uid).updateBMI(bmi);
  }

    clearAll() {
                 heightcontroller.clear();
                 weight=0;
  }
}