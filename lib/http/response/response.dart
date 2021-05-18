import 'dart:core';

import 'package:attendant/http/request/request.dart';
import 'package:attendant/model/Response.dart';

abstract class HttpCallBack {
  void onSuccess(Response response);

  void onError(var error);
}

class HttpResponse {
  HttpCallBack _callBack;
  HttpRequest request = new HttpRequest();

  HttpResponse(this._callBack);

  doComp(var driver, var circuit, var auto, var besTime,
      var laps) {
    request
        .setComp(driver, circuit, auto, besTime, laps)
        .then((comp) => _callBack.onSuccess(comp))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }

  doUserLogin(var email, var password) {
    request
        .getUserLogin(email, password)
        .then((login) => _callBack.onSuccess(login))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }

  doDriver(var username, var gender, var city, var mobile, var email) {
    request
        .addDriver(username, gender, city, mobile, email)
        .then((driver) => _callBack.onError(driver))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }

  doFetchDriver() {
    request
        .fetchDriver()
        .then((value) => _callBack.onSuccess(value))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }
}
