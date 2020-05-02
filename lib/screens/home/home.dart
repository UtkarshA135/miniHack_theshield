import 'package:flutter/material.dart';
import 'package:minihack_theshield/services/auth.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Container(
      child:   RaisedButton.icon(
                                 onPressed: () async {await _auth.signOut();},
                                 icon : Icon(Icons.exit_to_app),
                               label:
                               Text('Log Out',
                                  style: TextStyle(
                                   fontFamily: 'Lobster',
                                   color: Colors.grey[700],
                                  ),
                                 )

      ),
    );
  }
}