import 'dart:async';
import 'package:attendant/constants/route_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  final String title = "LoadingScreen"; //Helps in routing (navigation)
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var revName = "REV RACING LEAGUE";
  var slogan = 'Get Ready To Power Up';
  var year = '2021';
  final Color primaryColor = Colors.white;
  @override
  void initState() {
    // implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RouteController()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            //TODO update this
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/rev.png'),
                        height: 80.0,
                        width: 80.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Center(
                        child: Text(
                          '$revName',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '$year',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //.............................................progressive indicator
                            Visibility(
                              visible: true,
                              child: Container(
                                child: SpinKitFadingCube(
                                  color: Colors.red,
                                  size: 25.0,
                                ),
                              ),
                            ),

                            //............................................. end progressive indicator
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0, bottom: 5.0)),
                    Text(
                      '$slogan',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
