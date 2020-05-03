import 'package:flutter/material.dart';
import 'exercise_tile.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:minihack_theshield/models/users.dart';
import 'package:minihack_theshield/services/database.dart';
import 'package:theme_provider/theme_provider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    var list = ['1','2','3','4','5','6','7','8','9','10'];
   var list1 = ['crunches','bench press','push ups','dumbells','squats','lunges','burpees','medicine ball','leg press','situps'];
   var images = ['assets/crunches.jpg','assets/benchpress.jpg','assets/pushups.jpg','assets/dumbell.jpg','assets/squats.jpg','assets/lunges.jpg','assets/burpees.jpg','assets/medicineball.jpg','assets/legpress.jpg','assets/situps.jpg'];
   var list2 = ['30','40','60','30','40','60','30','40','60','40'];
   var musics= ['song6.mp3','song5.mp3','song4.mp3','song6.mp3','song5.mp3','song4.mp3','song6.mp3','song5.mp3','song4.mp3','song5.mp3'];
  
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
     title : Text('Exercises',style: TextStyle(fontSize: 30,  fontFamily: 'Pacifico', color: Colors.white),),
       centerTitle : true,
       backgroundColor: Colors.greenAccent,
     ),
      
     body :
       ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index)
      {
        
      int j = int.parse(list[index]);
 
       return ThemeConsumer( child :ExerciseTile(
          name: list1[j-1],
          alpha: list2[j-1],
          image : images[j-1],
          music :musics[j-1],
       ));
        
     ///print(j);
    }
    
       
      
               ) ) ,
   );
      
  
         }}