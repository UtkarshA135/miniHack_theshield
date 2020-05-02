import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:minihack_theshield/models/users.dart';
class DatabaseService
{ 
  final String uid;
  DatabaseService({
    this.uid
  });

final CollectionReference userCollection = Firestore.instance.collection('users');


Future updateUserData( String name , String uid, String weight , String height , String age ,String gender,String goalweight)
async
{
  return await userCollection.document(uid).setData({
    //'imageURL ': imageURL,
    'name' : name,
    'weight':weight,
    'height':height,
    'age': age,
    'gender': gender,
    'ownerid': uid,
   'goalweight': goalweight,
  
   } );
   
}
}