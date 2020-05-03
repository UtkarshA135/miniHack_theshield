import 'package:flutter/material.dart';
import 'exercise_tile.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:minihack_theshield/models/users.dart';
import 'package:minihack_theshield/services/database.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    var list = ['1','2','3','4','5','6','7','8','9','10'];
   var list1 = ['crunches','bench press','push ups','dumbells','squats','lunges','burpees','medicine ball','leg press','situps'];
   var list2 = ['2','6','9','12','15','18','21','24','27','30'];
  
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    String name = "";
    String age ="";
   
        
           print(name);
           print(age);
           return
            SafeArea(
             
                        child:
     Scaffold(appBar: AppBar(
       title : Text('List of exercises'),
       centerTitle : true,
       actions: <Widget>[
         RaisedButton(onPressed: ()  async{
               await _auth.signOut();
         },
  
         child:Text('Sign Out'),
         ),
       ],
     ),
       drawer: new StreamBuilder<UserData>(
         stream: DatabaseService(uid : user.uid).userData,
         builder: (context,snapshot){
           if(snapshot.hasData)
           {
            UserData  userData = snapshot.data;
            name= userData.name;
            age = userData.age;
             print(userData.name); 
            return Drawer(
        child: new ListView(
          children: <Widget>[
          
            new UserAccountsDrawerHeader(
              
              accountEmail: new Text(name),
              accountName: new Text(age),
                decoration: new BoxDecoration(
                image: new DecorationImage(
                 // image: new AssetImage("assets/fitness.jpg"),
                  fit: BoxFit.fill
                )
              ),
            
            ),]),);}}),
     body :
       ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index)
      {
        
      int j = int.parse(list[index]);
 
       return ExerciseTile(
          name: list1[j-1],
          alpha: list2[j-1],
        );
        
     ///print(j);
    }
    
       
      
               ) ) ,
   );
      
  
         }}