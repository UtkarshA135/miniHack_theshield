
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minihack_theshield/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minihack_theshield/models/users.dart';
import 'database.dart';

import 'package:path/path.dart';

class AuthService
{
 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userfromFirebaseUser(FirebaseUser user){
    return user!=null ? User(uid : user.uid) : null;
  }
Stream<User> get user{
  return _auth.onAuthStateChanged
  .map(_userfromFirebaseUser);
}


Future registerwithEmailandPassword(String email, String password , String name, String weight , String height , String age, String gender,String goalweight) async {
      
     try {
       print(email);
       print(password);
        print(age);
         print(weight);
         print(height);
         print(gender);
       print(goalweight);
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
       await DatabaseService(uid: user.uid).updateUserData(name, user.uid,weight,height,age,gender,goalweight);
      
       await user.sendEmailVerification();
        
        return _userfromFirebaseUser(user);
     } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
        return null;
     }

   }
   Future signInwithEmailandPassword(String email, String password) async{
     try{
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
       if (user.isEmailVerified)
        
        return _userfromFirebaseUser(user);
        else
        return null;
     }catch(e)
     {
       print("An error occured while trying to send email verification");
        print(e.message);
        return null;
     }
   }
    Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }
   Future signOut()
    async {
     try{ return await _auth.signOut();
   }
   catch(e)
   { 
     print(e.toString());
     return null;
   }}
   Future<String> getUserID() async{
     return ( await _auth.currentUser()).uid;
   }
    Future<FirebaseUser>getCurrentUser() async{
     return  await _auth.currentUser();
   }
}
