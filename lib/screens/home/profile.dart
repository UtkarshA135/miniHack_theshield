
import 'package:minihack_theshield/services/database.dart';
import 'package:minihack_theshield/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:minihack_theshield/models/users.dart';
import 'package:provider/provider.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'settings.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    final AuthService _auth = AuthService();
  @override
 
  Widget build(BuildContext context) {
     void showSettingpanel()
  {
    showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding : EdgeInsets.symmetric(vertical : 20.0 , horizontal : 60.0),
          child: Settings(),

        );
    }
    );
  }
 
    final user = Provider.of<User>(context);
    return SingleChildScrollView(
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
           
            
            
//print(userData.url);
           return SafeArea(
                        child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
               height: MediaQuery.of(context).size.height ,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                  //  gradient: LinearGradient(colors: aquaGradients)
                    ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Container(
                         padding: EdgeInsets.only(top: 30.0, bottom: 20.0, left: 30.0),
                         alignment: Alignment.centerLeft,
                         child: Text('My Profile',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Lobster',
                            decoration: TextDecoration.overline,
                            
                          ),
                          // textAlign: TextAlign.left,
                         ),
                       ),
                      

                       Text(
                        userData.name+" , "+userData.age,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[500],
                            fontFamily: 'Pacifico', 
                            
                          ),
                       ),
                       Text('Height(cm) :'+" " + userData.height,
                       style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[500],
                            fontFamily: 'Pacifico', 
                            
                          ),),
                           Text('Weight(kg) :'+" " + userData.weight,
                       style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[500],
                            fontFamily: 'Pacifico', 
                            
                          ),),
                          Text('BMI :'+" " + userData.bmi.toString().substring(0,4),
                       style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[500],
                            fontFamily: 'Pacifico', 
                            
                          ),),
                         Text(userData.status,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[500],
                            fontFamily: 'Pacifico', 
                            
                          ),
                         )

                           
                     ],
              
                   )),
                      
                    SizedBox(height : 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical : 15.0),
                       //height: MediaQuery.of(context).size.height *(2/3),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0), topRight: Radius.circular(100.0) )
               ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                            Column(
                            children: <Widget>[
                              NeuButton(
                                //color: Colors.white,
                                child: Icon(Icons.edit),
                                onPressed: ()=> showSettingpanel(),
                                decoration: NeumorphicDecoration(
                                   shape: BoxShape.circle ,
                                  color: Colors.white
                                 )
                                ),
                                Text('Edit Profile',
                                  style: TextStyle(
                                   fontFamily: 'Lobster',
                                   color: Colors.grey[700],
                                  ),
                          )
                            ],

                         ),
                           Column(
                            children: <Widget>[
                              NeuButton(
                                 onPressed: () async {await _auth.signOut();},
                                child: Icon(Icons.exit_to_app),
                                 decoration: NeumorphicDecoration(
                                   shape: BoxShape.circle ,
                                  color: Colors.white 
                                 ),
                                 ),
                               Text('Log Out',
                                  style: TextStyle(
                                   fontFamily: 'Lobster',
                                   color: Colors.grey[700],
                                  ),
                                 )
                             ],
                           )
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                      child: RotateAnimatedTextKit(
                        text: ['Just know that I would die for you', "You're my favorite kind of night","I'm just tryna get you out the friend zone",] ,
                        duration: Duration(seconds: 6),
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lobster',
                          color: Colors.teal[400],
                          ),
                        ),
                    )
               ]),
           );
         }
         else{
           return Center(child :Loading());
         }
         })
      ],)
    )));
      
    
  }
}

