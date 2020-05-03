import 'exercise_timer.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  String name ;
  String alpha;
  ExerciseTile({this.name,this.alpha});
  @override
  Widget build(BuildContext context) {
  //  print((int.parse(alpha)/60).floor());
  //  print((int.parse(alpha)%60).toString().padLeft(2,'0'));
    return Padding(
      padding:  EdgeInsets.only(top : 8.0),
      child:   Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage : AssetImage(''),
          ),
          onTap: (){
            Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => ExeTimer(t :alpha, n:name),
             ));
          },
          title : Text(name),
        
         // subtitle: Text('${(int.parse(alpha)/60).floor()}:${(int.parse(alpha)%60).toString().padLeft(2,'0')}'),
        
       
          //title : Text(name),
        
         subtitle: Text('${(int.parse(alpha)/60).floor()}:${(int.parse(alpha)%60).toString().padLeft(2,'0')}'),
        )
      )
      
);
  }
}