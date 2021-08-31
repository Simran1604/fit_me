import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BMI extends StatefulWidget {
  const BMI({ Key? key }) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double weight=0,height=0,bmi=0;
  @override
  Widget build(BuildContext context) {
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
                          style: TextStyle(fontSize: 20,
                          ),
                          )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:12.0,left: 12,right: 12),
                          child: TextFormField(
                          textAlign: TextAlign.center,
                          showCursor: false,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value){
                            height=;
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
                          style: TextStyle(fontSize: 20),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Center(child: Text("kg",
                          style: TextStyle(fontSize: 16),)),
                      ),
                      Slider(value: weight.toDouble(), min: 0,max: 200,
                  divisions: 200,
                  inactiveColor: Colors.red.shade100,
                  activeColor: Colors.redAccent,
                  onChanged:(double value){
                    setState(() {
                      weight=value;
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
                   
                     child: FloatingActionButton(onPressed: null,
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.calculate),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'BMICALC',
                     )
                 ),
                  Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed: null,
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
}