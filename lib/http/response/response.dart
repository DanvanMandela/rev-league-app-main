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

  doComp(var mobile, var name, var gender, var circuit, var auto, var besTime,
      var laps) {
    request
        .setComp(mobile, name, gender, circuit, auto, besTime, laps)
        .then((comp) => _callBack.onSuccess(comp))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }

  doUserLogin(var email, var password) {
    request
        .getUserLogin(email, password)
        .then((login) => _callBack.onSuccess(login))
        .catchError((onError) => _callBack.onError(onError.toString()));
  }
}
