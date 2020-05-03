import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minihack_theshield/screens/home/breakfast.dart';
import 'package:minihack_theshield/screens/home/dinner.dart';
import 'package:minihack_theshield/screens/home/lunch.dart';
import 'package:minihack_theshield/screens/home/snacks.dart';
import 'package:minihack_theshield/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:minihack_theshield/models/users.dart';
import 'package:minihack_theshield/services/database.dart';
import 'package:theme_provider/theme_provider.dart';
class DietPlan extends StatefulWidget {
  @override
  _DietPlanState createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  StreamSubscription<QuerySnapshot> _subscription;
  List<DocumentSnapshot> usersList;
  final CollectionReference _collectionReference =
      Firestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
    @override
     void initState()
  {
    super.initState();
   

  }

  @override
  Widget build(BuildContext context) {

    var options =['Breakfast','Lunch','Snacks','Dinner'];
    var images =['assets/breakfast1.jpg','assets/lunch.jpg','assets/snacks1.jpg','assets/dinner2.jpg'];
   var routes = [ Breakfast(),
   Lunch(),
   Snacks(),
   Dinner()

   ];
   final user = Provider.of<User>(context);
  /*SingleChildScrollView(
      child : IntrinsicHeight(
        child : Container(
      decoration: BoxDecoration(
      //  gradient: LinearGradient(colors: aquaGradients)
      ),
      // appBar: AppBar(
      //   title : Text('Profile'),
      //   centerTitle: true,
      // ),
      child: Column(

       
        children: <Widget>[
        
       StreamBuilder<UserData>(
         stream: DatabaseService(uid : user.uid).userData,
         builder: (context,snapshot){
       if(snapshot.hasData)
       {
            UserData  userData = snapshot.data;
           */
            
            
//print(userData.url);
           //return 
             return
             
           SafeArea(child: 
         
             
          
        Scaffold(
                  appBar: AppBar(
       title : Text('Diet Plan',style: TextStyle(fontSize: 30,  fontFamily: 'Pacifico', color: Colors.white),),
       centerTitle : true,
       backgroundColor: Colors.greenAccent,
                 ),
              
             body: Center(
           
              
         child :GridView.count(crossAxisCount: 2,
       primary : false,
       padding:  EdgeInsets.fromLTRB(10.0, 30.0, 10.0,10.0),
       crossAxisSpacing: 10.0,
       mainAxisSpacing: 50.0,
       children: List<Widget>.generate(4, (index){
          return GridTile(child: 
          Container(
            height: 600,
            child:
          Card(elevation: 7.0,
          
           //child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(images[index]),
                radius: 50.0,
              ),
              Text(options[index]),
             IconButton(icon: Icon(Icons.add), onPressed: (){
               Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => ThemeConsumer( child :routes[index]),
             ));
             })
            ],),
            
          )
            )  );
           }
     ))
       
               )));
    
         
}
/*else{
return Loading();

}*/
         
       
      }

