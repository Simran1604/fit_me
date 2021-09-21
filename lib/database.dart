import 'package:cloud_firestore/cloud_firestore.dart';

class databasebase{
  final String uid;
  databasebase({required this.uid});
  
  //firestore instance
  

  Future createNewuser(String name,String email, String password) async
  {
    
  }

   updateName(String name)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Name');
     db.doc(uid).set({'name':name});
  }


   updateBMI(double bmi)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('BMI');
     db.doc(uid).set({'BMI':bmi});
  }

   updateAge(double age)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Age');
     db.doc(uid).set({'age':age});
  }

    updateCal(int calorie)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('calorie');
     db.doc(uid).set({'calorie':calorie});
  }

    updatefat(double fat)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Fat%');
     db.doc(uid).set({'fat':fat});
  }

    updateGender(String gender)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Gender');
     db.doc(uid).set({'gender':gender});
  }

    updateHeight(double height)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Height');
     db.doc(uid).set({'height':height});
  }

    updateWeight(double weight)
  {
    final CollectionReference db=FirebaseFirestore.instance.collection('Weight');
     db.doc(uid).set({'weight':weight});
  }
}