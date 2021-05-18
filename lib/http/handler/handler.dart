import 'dart:convert';

import 'package:attendant/http/constants/Constant.dart';
import 'package:attendant/model/Response.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  Future<Response> compData(var driver, var circuit,
      var auto, var bestTime, var laps) async {
    var data = {
      "driver": "$driver",
      "circuit": "$circuit",
      "drive_mode": "$auto",
      "best_time": "$bestTime",
      "lap": "$laps"
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(Constant.compUrl), body: data);
    // Getting Server response into variable.
    final rData = jsonDecode(response.body);
    return Response.fromResponse(rData);
  }

  Future<Response> userLogin(String email, String password) async {
    // Getting value from Controller
    String _email = email;
    String _password = password;

    // Store all data with Param Name.
    var data = {
      "email": "$_email",
      "password": "$_password",
    };

    // Starting Web API Call.
    var response = await http.post(Uri.parse(Constant.loginUrl), body: data);
    // Getting Server response into variable.
    final rData = jsonDecode(response.body);
    print('Login Response: ${response.body}.');
    return Response.fromLoginResponse(rData);
  }

  Future<Response> addDriver(
      var username, var gender, var city, var mobile, var email) async {
    var data = {
      "mobile": "$mobile",
      "username": "$username",
      "gender": "$gender",
      "email": "$email",
      "city": "$city"
    };

    // Starting Web API Call.
    var response =
        await http.post(Uri.parse(Constant.createDriver), body: data);
    // Getting Server response into variable.
    final rData = jsonDecode(response.body);
    return Response.fromResponse(rData);
  }

  Future<Response> fetchDriver() async {
    var response = await http.get(Uri.parse(Constant.fetchDriversUrl));
    final data = jsonDecode(response.body);
    return Response.fromDriverResponse(data);
  }
}
