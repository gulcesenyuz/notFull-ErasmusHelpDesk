import 'dart:async';

import 'package:bau_help_desk/screens/views/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0XFF8B7053)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90.0,
                          child: Image(
                            image:
                                AssetImage('assets/images/bauglobal_logo.jpg'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 50.0,
                        ),
                      ),
                      Text(
                        'BAU EXCHANGE HELP DESK',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/help_logo_1.gif')),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
