import 'exercise_timer.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
class ExerciseTile extends StatelessWidget {
  String name ;
  String alpha;
  String image;
  String music;
  ExerciseTile({this.name,this.alpha,this.image,this.music});
  @override
  Widget build(BuildContext context) {
  //  print((int.parse(alpha)/60).floor());
  //  print((int.parse(alpha)%60).toString().padLeft(2,'0'));
    return Padding(
      padding:  EdgeInsets.only(top : 8.0),
      child:   Card(
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          
          leading: CircleAvatar(
            backgroundImage : AssetImage(image),
            radius: 30.0,
          ),
          onTap: (){
            Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => ThemeConsumer( child :ExeTimer(t :alpha, n:name,m:music)),
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