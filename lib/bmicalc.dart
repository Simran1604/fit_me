import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class bmicalc extends StatefulWidget {
  const bmicalc({ Key? key }) : super(key: key);

  @override
  _bmicalcState createState() => _bmicalcState();
}

class _bmicalcState extends State<bmicalc> {
  final firestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
              borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                "Your BMI is lala"
              ),
            ),
            FloatingActionButton(onPressed: getBmi())
          ],),
        ),
      ),
    );
  }

   getBmi () async{
    final bmi = await firestore.collection('userdata').get();
    for(var s in bmi.docs)
    print(s.data());
  }
}

// getBmiStream () async{
//   await for(var bmis in firestore.collection('userdata').snapshots()){
//     for(var bmi in bmis.docs)
//     print(bmi.data());
//   }
// }
// }