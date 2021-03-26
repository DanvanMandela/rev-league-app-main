import 'package:attendant/constants/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterDriver extends StatefulWidget {
  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  @override
  Widget build(BuildContext context) {
    //TODO update what details you want
    //test feild state
    String email = "";
    String password = "";
    String name = "";
    String city = "";
    String gender = "";
    String phonenumber = "";

    //for showing loading
    bool loading = false;

    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            //TODO update this
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'REV RACING LEAGUE',
                        style: TextStyle(
                          fontSize: 27.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        //TODO update this
                        'Register a Driver',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.white70)),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'Gender',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.white70)),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.white70)),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),

                      //city
                      SizedBox(
                        height: 16,
                      ),
                      //TODO remove unwanted containers

                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Phone',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.white70)),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                      //college
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'City',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.white70)),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Center(
                            child: Text(
                          'Register',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Center(
                            child: Text(
                          "Driver already exists?",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyNavBar()),
                          );
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Center(
                            child: Text(
                              "Go To Race",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
