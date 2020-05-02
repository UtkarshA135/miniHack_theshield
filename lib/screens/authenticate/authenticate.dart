import 'package:minihack_theshield/screens/authenticate/register.dart';
import 'package:minihack_theshield/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}
  bool isSignIn = false; 

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
  
    void toggleView()
    {
      setState(() {
        isSignIn = !isSignIn;
      });
    }
    if (isSignIn)
    {
      return
      PageViewWidget(toggleView : toggleView);
      // Register( toggleView : toggleView);
    }
    else
    {
    return SignIn( toggleView : toggleView);
  }}
}