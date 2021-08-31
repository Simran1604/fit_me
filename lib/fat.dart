import 'package:flutter/material.dart';

class fat extends StatefulWidget {
  const fat({ Key? key }) : super(key: key);

  @override
  _fatState createState() => _fatState();
}

class _fatState extends State<fat> {
  double weight=0;
  @override
  Widget build(BuildContext context) {
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
                                IconButton(onPressed:null, icon: Icon(Icons.male),iconSize: 40,focusColor: Colors.redAccent,),                             
                                IconButton(onPressed:null, icon: Icon(Icons.female),iconSize: 40,focusColor: Colors.redAccent,),                    
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
                        style: TextStyle(fontSize: 20),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                        textAlign: TextAlign.center,
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: null,
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
                      
                    ),
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
                        child: Center(child: Text("Neck",
                        style: TextStyle(fontSize: 20),)),
                      ),
                       Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right:12,bottom:20),
                        child: TextFormField(
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
                        child: Center(child: Text("Waist",
                        style: TextStyle(fontSize: 20),)),
                      ),
                       Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(child: Text("cm",
                          style: TextStyle(fontSize: 16),)),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0,right: 12.0,bottom: 25),
                        child: TextFormField(
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
                   
                     child: FloatingActionButton(onPressed: null,
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.calculate),
                      elevation: 4,
                      highlightElevation: 8,
                      heroTag: 'FATCALC',
                     )
                 ),
                  Padding(
                   padding: const EdgeInsets.all(12.0),
                   
                     child: FloatingActionButton(onPressed: null,
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
}