
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'package:minihack_theshield/services/database.dart';

import 'package:provider/provider.dart';
import 'package:minihack_theshield/models/users.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final List<String> genders = ['MALE' , 'FEMALE' ];
// File _image;
  String name ;
  String  age ;
 String gender;
 String height ;
 String error ;
 bool loading = false;
 String goalweight;
 String weight;
  @override
  Widget build(BuildContext context) {
  
    final user = Provider.of<User>(context);
    return  GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child : SingleChildScrollView(
      child : IntrinsicHeight(child: 
       StreamBuilder<UserData>(
         stream: DatabaseService(uid : user.uid).userData,
         builder: (context,snapshot){
           if(snapshot.hasData)
           {
            UserData  userData = snapshot.data;
            return Form(
        key: _formkey,
         child : Column(
        children: <Widget> [
        
          SizedBox(height: 20.0),
              Center(child: 
         Text('Revamp your profile',
         style: TextStyle(
           fontSize :25.0,
           fontFamily: 'Lobster',
           decoration: TextDecoration.overline,
         ),
           
           
         ),
            ),
      
        
      SizedBox(height : 20.0),
         Expanded(child: 
           TextFormField(
            decoration: InputDecoration(
               labelText: 'Enter Name',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
              // prefixIcon: Icon(Icons.person, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               )
             ),
             initialValue: userData.name,
           validator: (val) => val.isEmpty ? 'Enter a valid name':null,
           onChanged: (val)
           { 
            setState(() => name = val);
           }),),
        SizedBox(height: 20.0),
            Expanded(
              child :
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter your Height in cm',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.person, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               )
             ),
              initialValue: userData.height,
           validator: (val) => val.isEmpty ? 'Enter your height ':null,
           onChanged: (val)
           {
            setState(() => height = val);
           }),
            ),
         SizedBox(height: 20.0),
         Expanded(child: 
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter weight',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.lock, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               ),
             /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
             ),
               initialValue: userData.weight,
           validator: (val) => val.isEmpty ? 'Enter your weight':null,
          //  obscureText: true,
         // obscureText: _isvisible,
           onChanged : (val){
             setState(() =>
               weight=val
        );

           },
         ),),
         SizedBox(height : 20.0),
           Align(
             alignment: Alignment.centerLeft,
             child:Text('Gender:',
             
             )),
           SizedBox(height:10.0),
           
            Row(
              children: <Widget>[
                Radio(
                value:  'MALE',
                groupValue: gender,
           onChanged: (val)
           {
            setState(() => gender = val);
           }),
           Text('Male'),
            
             ],),
            Row(
              children: <Widget>[
                Radio(
                value:  'FEMALE',
                groupValue: gender,
           onChanged: (val)
           {
              setState(() => gender = val);
           }),
           Text('Female'),
              ],
            ),
       SizedBox(height: 20.0),
       Expanded(child: 
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter age',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.lock, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               ),
             /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
             ),
               initialValue: userData.age,
           validator: (val) => val.isEmpty ? 'Enter your age':null,
          //  obscureText: true,
         // obscureText: _isvisible,
           onChanged : (val){
             setState(() =>
               age=val
        );

           },
         ),),
         SizedBox(height : 20.0),
         Expanded(child: 
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter your Goal weight',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.lock, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               ),
             /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
             ),
           validator: (val) => val.isEmpty ? 'Enter your goal weight':null,
           initialValue: userData.goalweight,
          //  obscureText: true,
         // obscureText: _isvisible,
           onChanged : (val){
             setState(() =>
               goalweight=val
        );

           },
         ),),
         SizedBox(height : 20.0),
         GestureDetector(
           child: Container(
             padding: EdgeInsets.all(8.0),
             width: MediaQuery.of(context).size.width *0.8,
             decoration: BoxDecoration(
             //  gradient: LinearGradient( colors: aquaGradients),
             color: Colors.amber,
               borderRadius: BorderRadius.circular(20.0)
             ),
             child: Center(child: Text('Update')),
           ),
           onTap:() async {
           if(_formkey.currentState.validate())
         {
             await DatabaseService(uid : user.uid).updateUserData(
                 name ?? userData.name,
                  user.uid,
                  weight ?? userData.weight,
                   height ?? userData.height,
                
                  age ?? userData.age,
                  gender ?? userData.gender,
                 
               
           
            goalweight?? userData.goalweight,
           );

             
             
             Navigator.pop(context);
  
         }}
         ),
        //  Expanded(child: 
        //  RaisedButton(child: Text('Update'),
        //  color: Colors.cyan,
        //  onPressed:() async {
        //    if(_formkey.currentState.validate())
        //  {
        //      await DatabaseService(uid : user.uid).updateUserData(name ?? userData.name,
        //      age ?? userData.age,
        //      bio ?? userData.bio,
        //      gender ?? userData.gender,
        //      url ?? userData.url);
        //      Navigator.pop(context);
  
        //  }})),
        ]

      ),);
           }
         } 
       )) ));
}}
