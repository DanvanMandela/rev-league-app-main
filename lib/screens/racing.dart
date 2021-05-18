import 'dart:convert';

import 'package:attendant/http/constants/Constant.dart';
import 'package:attendant/http/response/response.dart';
import 'package:attendant/model/Response.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

enum Gender { MALE, FEMALE, OTHER }
enum Online { YES, NO }
enum Auto { ON, OFF }

extension GenderExtension on Gender {
  String get _gender {
    switch (this) {
      case Gender.FEMALE:
        return "FEMALE";
      case Gender.MALE:
        return "MALE";
      case Gender.OTHER:
        return "OTHER";
      default:
        return null;
    }
  }
}

extension AutoExtension on Auto {
  String get _auto {
    switch (this) {
      case Auto.OFF:
        return "off";
      case Auto.ON:
        return "on";
      default:
        return null;
    }
  }
}

class Racing extends StatefulWidget {
  @override
  _RacingState createState() => _RacingState();
}

class _RacingState extends State<Racing> implements HttpCallBack {
  // declare dropdown activity......................
  String _myActivity;
  String _myActivityResult;
  String _driver;

  final String url = Constant.fetchDriversUrl;
  List data = List();

  Future<String> getDriversData() async {
    var response = await http.get(Uri.parse(Constant.fetchDriversUrl),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(response.body);
    setState(() {
      data = resBody;
    });
    print(resBody);
    return "Sucess";
  }

  String name;
  String mobile;
  String laps;
  String bestTime;
  String gender;
  String auto;

  //validate fields
  bool _validate = false;

  TextEditingController _name = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _laps = TextEditingController();
  TextEditingController _bestTime = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _auto = TextEditingController();
  TextEditingController _circuit = TextEditingController();

  //declare global keys ........................
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Declare gender method
  Gender _genderValue;
  Auto _autoValue;

  //Online Service methode
  Online _onlineValue;

  ProgressDialog pr;

  //Declare response
  HttpResponse _response;

  //initialize response
  _RacingState() {
    _response = new HttpResponse(this);
  }

  @override
  void initState() {
    super.initState();
    this.getDriversData();
  }

  //on login button clicked calls this
  void _submit() {
    final form = _formKey.currentState;
    if (form.validate() && _validate == false) {
      pr.show();
      setState(() {
        form.save();
        _response.doComp(_driver, _myActivity, auto, bestTime, laps);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
              right: 15,
              bottom: 0,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Center(
                                    child: Text(
                                      'REV RACING LEAGUE',
                                      style: TextStyle(
                                        fontSize: 27.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.red,
                                height: 20,
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "DRIVER",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Card(
                                child: DropdownButton(
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['username']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      _driver = newVal;
                                    });
                                  },
                                  value: _driver,
                                ),
                                elevation: 3,
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "GENDER",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              RadioListTile(
                                title: const Text('Male'),
                                value: Gender.MALE,
                                groupValue: _genderValue,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _genderValue = value;
                                      Gender data = value;
                                      gender = data._gender;
                                    },
                                  );
                                },
                              ),
                              RadioListTile(
                                title: const Text('Female'),
                                value: Gender.FEMALE,
                                groupValue: _genderValue,
                                onChanged: (Gender value) {
                                  setState(() {
                                    _genderValue = value;
                                    Gender data = value;
                                    gender = data._gender;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text('Other'),
                                value: Gender.OTHER,
                                groupValue: _genderValue,
                                onChanged: (Gender value) {
                                  setState(() {
                                    _genderValue = value;
                                    Gender data = value;
                                    gender = data._gender;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "SELECT CIRCUIT",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                child: DropDownFormField(
                                  titleText: '',
                                  hintText: 'Please choose circuit of the week',
                                  value: _myActivity,
                                  onSaved: (value) {
                                    setState(() {
                                      _myActivity = value;
                                    });
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _myActivity = value;
                                    });
                                  },
                                  dataSource: [
                                    {
                                      "display": "Week 1: Sochi",
                                      "value": "Sochi",
                                    },
                                    {
                                      "display": "Week 2: Zandvoort",
                                      "value": "Zandvoort",
                                    },
                                    {
                                      "display": "Week 3: Barcelona-GP",
                                      "value": "Barcelona",
                                    },
                                    {
                                      "display": "Week 4: Spa",
                                      "value": "Spa",
                                    },
                                    {
                                      "display": "Week 5: Suzuka",
                                      "value": "Suzuka",
                                    },
                                    {
                                      "display": "Week 6: Monza",
                                      "value": "Monza",
                                    },
                                    {
                                      "display": "Week 7: Montreal",
                                      "value": "Montreal",
                                    },
                                    {
                                      "display": "Week 8: Bahrain",
                                      "value": "Bahrain",
                                    },
                                    {
                                      "display": "Week 9: Baku",
                                      "value": "Baku",
                                    },
                                  ],
                                  textField: 'display',
                                  valueField: 'value',
                                ),
                                elevation: 3,
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "AUTOMATIC GEARBOX",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              RadioListTile(
                                title: const Text('On'),
                                value: Auto.ON,
                                groupValue: _autoValue,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _autoValue = value;
                                      Auto data = value;
                                      auto = data._auto;
                                    },
                                  );
                                },
                              ),
                              RadioListTile(
                                title: const Text('Off'),
                                value: Auto.OFF,
                                groupValue: _autoValue,
                                onChanged: (value) {
                                  setState(() {
                                    _autoValue = value;
                                    Auto data = value;
                                    auto = data._auto;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "BEST TIME",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 10),
                                child: TextFormField(
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  onSaved: (val) => bestTime = val,
                                  controller: _bestTime,
                                  decoration: new InputDecoration(
                                    labelText: "Best Time",
                                    fillColor: Colors.black,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Best time cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Text(
                                  "LAPS",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 10),
                                child: TextFormField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  onSaved: (val) => laps = val,
                                  controller: _laps,
                                  decoration: new InputDecoration(
                                    labelText: "Completed Laps",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Lapse cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                                _laps.text.isNotEmpty &&
                                _bestTime.text.isNotEmpty &&
                                _gender != null &&
                                _auto != null &&
                                _myActivity != null) {
                              if (_formKey.currentState.validate()) {
                                //pr.show();
                                _validate = false;
                                _submit();
                              }
                            } else {
                              if (_name.text.isEmpty) {
                                _validate = true;
                                showToast("Driver name required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }
                              if (_mobile.text.isEmpty) {
                                _validate = true;
                                showToast("Driver mobile required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }

                              if (_laps.text.isEmpty) {
                                _validate = true;
                                showToast("Laps required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }

                              if (_bestTime.text.isEmpty) {
                                _validate = true;
                                showToast("Best time required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }
                              if (gender == null) {
                                _validate = true;
                                showToast("Driver gender required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }
                              if (auto == null) {
                                _validate = true;
                                showToast("Auto mode required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }

                              if (_myActivity == null) {
                                _validate = true;
                                showToast("Circuit required",
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.BOTTOM);
                              }
                            }
                          });
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
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
}
