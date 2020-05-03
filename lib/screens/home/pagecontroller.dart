import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'package:provider/provider.dart';
import 'dietplan.dart';
import 'progress.dart';
import 'exercise.dart';
import 'profile.dart';
import 'package:theme_provider/theme_provider.dart';
class NavigatoBAR extends StatefulWidget {

  @override
  _PagecontrollerState createState() => _PagecontrollerState();
}

class _PagecontrollerState extends State<NavigatoBAR> {
   int selected_page = 1;
  
  @override
  Widget build(BuildContext context) {
      
  final pageOption = [
 ThemeConsumer ( child :DietPlan()),
 ThemeConsumer ( child :Home()),
 ThemeConsumer ( child :Progress()),
 ThemeConsumer ( child :Profile()),

  ];
    return Scaffold(
       body: pageOption[selected_page],
       bottomNavigationBar: FancyBottomNavigation(
         initialSelection: 1,
           tabs: [
        TabData(iconData: Icons.list , title: "Diet Plan"),
        TabData(iconData: Icons.timer, title: "Exercises"),
        TabData(iconData: Icons.pie_chart, title: "Progress"),
         TabData(iconData: Icons.person, title: "Me"),

    ],
    onTabChangedListener: (index) {
        setState(() {
        selected_page = index;
        });
    },
    circleColor: Colors.greenAccent,
    inactiveIconColor: Colors.greenAccent
       ),

     
    );
  }
}
