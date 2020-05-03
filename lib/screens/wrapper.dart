import 'package:minihack_theshield/screens/authenticate/authenticate.dart';
import 'package:minihack_theshield/screens/authenticate/signup.dart';
import 'package:minihack_theshield/screens/home/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minihack_theshield/models/users.dart';
import 'package:theme_provider/theme_provider.dart';
//import 'package:covidate/screens/home/pagecontroller.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

   if (user == null)
   {
   
     return ThemeConsumer(child: Authenticate());
   }
   else 
   return ThemeConsumer(child:  NavigatoBAR());
  }
}