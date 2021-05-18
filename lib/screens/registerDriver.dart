import 'package:attendant/constants/navigation_bar.dart';
import 'package:attendant/http/response/response.dart';
import 'package:attendant/model/Response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class RegisterDriver extends StatefulWidget {
  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver>
    implements HttpCallBack {
  String email = "";
  String password = "";
  String name = "";
  String city = "";
  String gender = "";
  String phonenumber = "";

  //for showing loading
  bool loading = false;
  ProgressDialog pr;

  //validate fields
  bool _validate = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _mobile = TextEditingController();

//declare global keys ........................
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Declare response
  HttpResponse _response;

  //initialize response
  _RegisterDriverState() {
    _response = new HttpResponse(this);
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate() && _validate == false) {
      pr.show();
      setState(() {
        form.save();
        _response.doDriver(_name, _gender, _city, _mobile, _email);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO update what details you want
    // this below line is used to make notification bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
    );

    pr.style(
      message: 'Loading',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
    );

    return Scaffold(
      body: Stack(
        key: _scaffoldKey,
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
          Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
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
                                  child: TextFormField(
                                    controller: _name,
                                    onSaved: (val) => name = val,
                                    keyboardType: TextInputType.text,
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
                                  child: TextFormField(
                                    controller: _gender,
                                    onSaved: (val) => gender = val,
                                    keyboardType: TextInputType.text,
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
                                  child: TextFormField(
                                    controller: _email,
                                    onSaved: (val) => email = val,
                                    keyboardType: TextInputType.text,
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
                                  child: TextFormField(
                                    controller: _mobile,
                                    onSaved: (val) => phonenumber = val,
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
                                  child: TextFormField(
                                    controller: _city,
                                    onSaved: (val) => city = val,
                                    keyboardType: TextInputType.text,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: MaterialButton(
                              height: 50,
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(color: logoGreen),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (_name.text.isNotEmpty &&
                                      _mobile.text.isNotEmpty &&
                                      _email.text.isNotEmpty &&
                                      _gender.text.isNotEmpty &&
                                      _city.text.isNotEmpty) {
                                    if (_formKey.currentState.validate()) {
                                      _validate = false;
                                      _submit();
                                    }
                                  } else {
                                    _validate = true;
                                    showToast("All Fields required",
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                });
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyNavBar()),
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
              )),
        ],
      ),
    );
  }

  @override
  void onError(error) {
    pr.hide();
    showToast(error, duration: Toast.LENGTH_SHORT);
  }

  @override
  void onSuccess(Response response) {
    pr.hide();
    showToast(response.message,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
