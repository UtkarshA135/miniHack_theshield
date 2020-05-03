import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:minihack_theshield/models/users.dart';
class DatabaseService
{ 
  final String uid;
  DatabaseService({
    this.uid
  });

final CollectionReference userCollection = Firestore.instance.collection('users');

int w;
int h;
double bmi;
double bmr;
String status;
Future updateUserData( String name , String uid, String weight , String height , String age ,String gender,String goalweight)
async
{
       w = int.parse(weight);
            h =int.parse(height);
           
          bmi =(100*100* w/(h*h));
          if(bmi<18.5)
          {
            status = "Underweight";
          }
         else if(bmi>=18.5&&bmi<=24.9)
         {
           status = "Normal Weight";
         }
         else if(bmi>=25&&bmi<=29.9)
         {
           status = "Over Weight";
         }
            else if(bmi>=30&&bmi<34.9)
         {
           status = "Class I Obesity";
         }
            else if(bmi>=35&&bmi<39.9)
         {
           status = "Class II Obesity";
         }
         else if(bmi>=40.0)
         {
           status = "Class III Obseity";
         }
            if(gender=="MALE")
            {
              bmr = 88.362 + (13.397 * int.parse(weight) ) + (4.799 * int.parse(height)) - (5.677 * int.parse(age));
            }
           else if(gender == "FEMALE")
      {
       bmr = 447.593 + (9.247 * int.parse(weight) ) + (3.098 *int.parse(height )) - (4.330 * int.parse(age));
      }
  return await userCollection.document(uid).setData({
    //'imageURL ': imageURL,
    ''
    'name' : name,
    'weight':weight,
    'height':height,
    'age': age,
    'gender': gender,
    'ownerid': uid,
   'goalweight': goalweight,
    'bmi' : bmi,
    'status':status,
    'bmr':bmr,
   } );
   
}
UserData _userDatafromSnapshot(DocumentSnapshot snapshot){
  return UserData(gender: snapshot.data['gender'],
    age: snapshot.data['age'],
    height : snapshot.data['height'],
    name : snapshot.data['name'],
    uid : uid,
    goalweight: snapshot.data['goalweight'],
    
    weight : snapshot.data['weight'],
    bmi :snapshot.data['bmi'],
    status: snapshot.data['status'],
    bmr : snapshot.data['bmr'],
   );
}

Stream<UserData> get userData{
  return userCollection.document(uid).snapshots().map(_userDatafromSnapshot);
}
}