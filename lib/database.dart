import 'package:cloud_firestore/cloud_firestore.dart';

class databasebase{
  final String uid;
  databasebase({required this.uid});
  
  //firestore instance
  final CollectionReference db=FirebaseFirestore.instance.collection('userdata');

  Future createNewuser(String name,String email, String password) async
  {
    await db.doc(uid).set({
      'name':name,
      'email':email,
      });
  }

   updateBMI(double bmi)
  {
     db.doc(uid).set({'BMI':bmi});
  }

   updateAge(double age)
  {
     db.doc(uid).set({'age':age});
  }

    updateCal(int calorie)
  {
     db.doc(uid).set({'calorie':calorie});
  }

    updatefat(double fat)
  {
     db.doc(uid).set({'fat':fat});
  }

    updateGender(String gender)
  {
     db.doc(uid).set({'gender':gender});
  }

    updateHeight(double height)
  {
     db.doc(uid).set({'height':height});
  }

    updateWeight(double weight)
  {
     db.doc(uid).set({'weight':weight});
  }
}