import 'package:minihack_theshield/screens/wrapper.dart';
import 'package:minihack_theshield/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/users.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:theme_provider/theme_provider.dart';

  
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
runApp(MyApp(),
);}
 
class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return  
       ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: <AppTheme>[
        AppTheme.light(),
        AppTheme.dark(),],
        child:
    StreamProvider<User>.value(
          
           value : AuthService().user,
            child : MaterialApp(
               theme: ThemeData(
        canvasColor: Colors.blueGrey,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
      home :ThemeConsumer(

      child:
      Wrapper(),),
      debugShowCheckedModeBanner: false,),
       ));
  }
}