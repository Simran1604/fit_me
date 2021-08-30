import 'package:fit_me/water.dart';
import 'package:flutter/material.dart';

import 'BMI.dart';
import 'fat.dart';

class tabbar extends StatefulWidget {
  const tabbar({ Key? key }) : super(key: key);

  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
  home:   DefaultTabController(length: 3, 
         child:  Scaffold(
         appBar: AppBar(
           bottom: TabBar(tabs: 
           [
             Text("BMI"),
            Text("Fat %"),
             Text("Water Intake")
           ],
         indicatorColor: Colors.redAccent),
           title: Center(child: Text("FitMe",
           style: TextStyle(color: Colors.redAccent),)),
         ),
         body: TabBarView(children: [
           BMI(),
           fat(),
           water(),
         ],)
         ),
         ),
    );
  }
}