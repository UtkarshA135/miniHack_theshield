import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';

import 'package:minihack_theshield/screens/authenticate/signup.dart';
import 'package:minihack_theshield/screens/home/intro.dart';
import 'package:minihack_theshield/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minihack_theshield/services/auth.dart';

class PageViewWidget extends StatefulWidget {
  final Function toggleView;
  PageViewWidget({this.toggleView});
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

String email = '';
String password = '';
String name = ' ';
String height = "";
String weight = "";
String goalweight = "";
String age = "";
String gender = "";
bool loading = false;

class _PageViewWidgetState extends State<PageViewWidget> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  /* static final GlobalKey<ScaffoldState> _scaffoldKey =
          GlobalKey<ScaffoldState>();*/
  bool _isvisible = true;

  void toggleVisibility() {
    setState(() {
      _isvisible = !_isvisible;
    });
  }

  ///Page Controller for the PageView
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              /* appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
                'Page View Widget',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster"),
              ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(actionIcon),
                  onPressed: () {
                    setState(() {
                      scrollDirection == Axis.horizontal
                          ? scrollDirection = Axis.vertical
                          : scrollDirection = Axis.horizontal;
                      actionIcon == Icons.swap_vert
                          ? actionIcon = Icons.swap_horiz
                          : actionIcon = Icons.swap_vert;
                   
                    });
                    controller.position.applyViewportDimension(
                        scrollDirection == Axis.vertical
                            ? _screenSize.height
                            : _screenSize.width);
                  }),
              IconButton(
                icon: Icon(Icons.code),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                  //  builder: (context) => CodeScreen(code: Code.pageViewCode),
                  ),
                ),
              )
            ],
          ),*/
              ///A Page View with 3 children
              body: PageView(
                controller: controller,
                scrollDirection: scrollDirection,

                ///Enable physics property to provide your PageView with a
                ///custom scroll behaviour
                ///Here BouncingScrollPhysics will pull back the boundary
                ///item (first or last) if the user tries to scroll further.
                //physics: BouncingScrollPhysics(),
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                            AssetImage('assets/fitness1.jpg'),
                            radius: 150.0
                            ),
                            Text(
                              "Get Fit!",
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'Pacifico'),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                               CircleAvatar(
                              backgroundImage:
                            AssetImage('assets/dailytrack.jpg'),
                            radius: 150.0
                            ),
                            Text(
                              "Track your daily progress.",
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'Pacifico'),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              CircleAvatar(
                              backgroundImage:
                            AssetImage('assets/motivation.jpg'),
                            radius: 150.0
                            ),
                            Text(
                              "Get daily motivation!",
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'Pacifico'),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                            AssetImage('assets/burger.jpg'),
                            radius: 150.0
                            ),
                            Text(
                              "It\'s okay to get off track.Start fresh next day.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontFamily: 'Pacifico'),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                            AssetImage('assets/fitness.jpg'),
                            radius: 150.0
                            ),
                            Text("Ready to start your fitness journey?",
                            textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),),
                          ]),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      child: Card(
                          child: SingleChildScrollView(
                        // padding: EdgeInsets.symmetric(vertical : 20.0 , horizontal : 50.0),
                        child: IntrinsicHeight(
                          child: Form(
                            key: _formkey,
                            child: Column(children: <Widget>[
                              SizedBox(height: 100),
                              
                                Text("Welcome to",style: TextStyle(fontSize: 20),),
                                SizedBox(height: 10.0),
                                
                              
                              Text('Ctrl-ALt-Zen',style: TextStyle(
                                  fontSize: 30, fontFamily: 'Pacifico'),),
                                  SizedBox(height: 10.0),

                             
                               Text("Rest a while and run a mile!",style: TextStyle(fontSize: 20),),
                               
                              

                              SizedBox(height: 60.0),
                              Expanded(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter Email',
                                        labelStyle:
                                            TextStyle(color: Colors.pink),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.pink,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an Email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Enter password',
                                      labelStyle: TextStyle(color: Colors.pink),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.pink,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      suffixIcon: IconButton(
                                          onPressed: toggleVisibility,
                                          icon: Icon(!_isvisible
                                              ? Icons.visibility
                                              : Icons.visibility_off))),
                                  validator: (val) => val.length < 6
                                      ? 'Enter a password of atleast 6 characters'
                                      : null,
                                  //  obscureText: true,
                                  obscureText: _isvisible,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter Name',
                                        labelStyle:
                                            TextStyle(color: Colors.pink),
                                        // prefixIcon: Icon(Icons.person, color: Colors.pink,),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter a valid name'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => name = val);
                                    }),
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter your Height in cm',
                                        labelStyle:
                                            TextStyle(color: Colors.pink),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.pink,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your height '
                                        : null,
                                    onChanged: (val) {
                                      setState(() => height = val);
                                    }),
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter weight',
                                    labelStyle: TextStyle(color: Colors.pink),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.pink,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
                                  ),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter your weight' : null,
                                  //  obscureText: true,
                                  // obscureText: _isvisible,
                                  onChanged: (val) {
                                    setState(() => weight = val);
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('   Gender:',style: TextStyle(color: Colors.pink,fontSize: 16),)),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Radio(
                                      value: 'MALE',
                                      groupValue: gender,
                                      onChanged: (val) {
                                        setState(() => gender = val);
                                      }),
                                  Text('Male'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                      value: 'FEMALE',
                                      groupValue: gender,
                                      onChanged: (val) {
                                        setState(() => gender = val);
                                      }),
                                  Text('Female'),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter age',
                                    labelStyle: TextStyle(color: Colors.pink),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.pink,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
                                  ),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter your age' : null,
                                  //  obscureText: true,
                                  // obscureText: _isvisible,
                                  onChanged: (val) {
                                    setState(() => age = val);
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter your Goal weight',
                                    labelStyle: TextStyle(color: Colors.pink),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.pink,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    /*  suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))*/
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? 'Enter your goal weight'
                                      : null,
                                  //  obscureText: true,
                                  // obscureText: _isvisible,
                                  onChanged: (val) {
                                    setState(() => goalweight = val);
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        //   gradient: LinearGradient(colors: aquaGradients),
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Register',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (_formkey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      loading = true;
                                      /* if(url == null)
          {
            setState(() {
               loading = false;
              error = 'Please upload a image !!  ';

            });
          }*/
                                      dynamic result = await _auth
                                          .registerwithEmailandPassword(
                                              email,
                                              password,
                                              name,
                                              weight,
                                              height,
                                              age,
                                              gender,
                                              goalweight);

                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error =
                                              'Please supply a valid credentials !!  ';
                                        });
                                      }
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Intro()));
                                  },
                                ),
                              ),
                              SizedBox(height:15),
                              FlatButton(
                                child:
                                    Text("Already have an account? Login now"),
                                onPressed: () {
                                  widget.toggleView();
                                },
                              ),
                              SizedBox(height: 12.0),
                              Expanded(
                                  child: Text(
                                error,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              )),
                            ]),
                          ),
                        ),
                      )))
                ],
              ),
            ));
  }
}
/*
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

String email ='';
 String password = '';
 String name = ' ';

 bool loading = false;
 
class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final List<String> genders = ['MALE' , 'FEMALE' ,'OTHERS'];
 //File _image;
 final CollectionReference matchRef = Firestore.instance.collection('matches');
 bool _isvisible= true;

 void toggleVisibility(){
   setState(() {
     _isvisible = !_isvisible;
  });
}
  @override
  Widget build(BuildContext context) {


   return loading ? Loading() :  GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child : Scaffold(

        
   
//  appBar: AppBar(
//       backgroundColor : Colors.orange[800],
//       title : Text('Sign-Up'),
//       actions :<Widget>[
//         FlatButton.icon(onPressed: (){
//           widget.toggleView();
//         }, icon: Icon(Icons.person), label: Text('Sign-In')),
//       ]

//     ),
    body: SingleChildScrollView(
       
      // padding: EdgeInsets.symmetric(vertical : 20.0 , horizontal : 50.0),
      child : IntrinsicHeight(
        child : Container(
          color: Colors.white,
        padding: EdgeInsets.symmetric(vertical : 20.0 , horizontal : 20.0),
      //     decoration: BoxDecoration(
       
      //   gradient : LinearGradient(colors: [Colors.orange[400],Colors.orange[900],Colors.orange,Colors.red[700],Colors.red[900]],
      //    begin : Alignment.topCenter,
      //   end : Alignment.bottomCenter,
      //   stops: [0.2,0.4,0.6,0.8,1.0])
      // ),
      child : Form(
        key: _formkey,
         child : Column(
        children: <Widget> [
        
          SizedBox(height: 20.0),
             
            Expanded(child: 
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter Email',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.person, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               )
             ),
           validator: (val) => val.isEmpty ? 'Enter an Email':null,
           onChanged: (val)
           {
            setState(() => email = val);
           }),
            ),
         SizedBox(height: 20.0),
         Expanded(child: 
         TextFormField(
           decoration: InputDecoration(
               labelText: 'Enter password',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
               prefixIcon: Icon(Icons.lock, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               ),
               suffixIcon: IconButton(
                 onPressed: toggleVisibility,
                 icon: Icon(!_isvisible? Icons.visibility: Icons.visibility_off))
             ),
           validator: (val) => val.length < 6 ? 'Enter a password of atleast 6 characters':null,
          //  obscureText: true,
          obscureText: _isvisible,
           onChanged : (val){
             setState(() =>
               password=val
        );

           },
         ),),
         SizedBox(height : 20.0),
         Expanded(child: 
           TextFormField(
            decoration: InputDecoration(
               labelText: 'Enter Name',
               labelStyle: TextStyle(
                 color: Colors.pink
               ),
              // prefixIcon: Icon(Icons.person, color: Colors.pink,),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50.0)
               )
             ),
           validator: (val) => val.isEmpty ? 'Enter a valid name':null,
           onChanged: (val)
           { 
            setState(() => name = val);
           }),),
         SizedBox(height: 20.0),


         Expanded(child: 
          GestureDetector(
             child: Container(
               width: MediaQuery.of(context).size.width*0.8,
               
               alignment: Alignment.center,
             decoration: BoxDecoration(
           //   gradient: LinearGradient(colors: aquaGradients),
              
               borderRadius: BorderRadius.circular(50.0)
             ),
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Text('Register' , style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
             ), 
           ),
         onTap:() async {
           if(_formkey.currentState.validate())
          { setState(() {
            loading =true;
          });
           loading = true;
                 /* if(url == null)
          {
            setState(() {
               loading = false;
              error = 'Please upload a image !!  ';

            });
          }*/
             dynamic result = await _auth.registerwithEmailandPassword(email, password,name);
            
              
            
          if(result == null)
          {
            
            setState(() {
               loading = false;
              error = 'Please supply a valid credentials !!  ';
            });
          }
          
          
          }
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Intro() ));
         },),),
         FlatButton(
             child: Text("Already have an account? Login now"),
             onPressed: (){
            widget.toggleView();
          } ,
           ),
         SizedBox(height : 12.0),
         Expanded(child: 
         Text(error,
         style : TextStyle(
           color:  Colors.black,
           fontWeight : FontWeight.bold,
           fontSize : 15.0,

         ),)),
       /*  Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                WavyFooter(),
                CirclePink(),
                CircleYellow(),
              ],
            )*/
        ]

      )

      ))
    ),
   
      
    ) ),);
  }
  }
*/