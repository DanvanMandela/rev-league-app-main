import 'dart:convert';

import 'package:attendant/http/constants/Constant.dart';
import 'package:attendant/model/Response.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  Future<Response> compData(var mobile, var name, var gender, var circuit,
      var auto, var bestTime, var laps) async {
    var data = {
      "mobile": "$mobile",
      "name": "$name",
      "gender": "$gender",
      "circuit": "$circuit",
      "auto": "$auto",
      "best_time": "$bestTime",
      "laps": "$laps"
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
}
