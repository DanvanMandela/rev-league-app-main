import 'package:attendant/http/handler/handler.dart';
import 'package:attendant/model/Response.dart';

class HttpRequest {
  HttpHandler handler = new HttpHandler();

  Future<Response> setComp(var mobile, var name, var gender, var circuit,
      var auto, var besTime, var laps) {
    var result =
        handler.compData(mobile, name, gender, circuit, auto, besTime, laps);
    return result;
  }

  Future<Response> getUserLogin(var email, var password) {
    var result = handler.userLogin(email, password);
    return result;
  }
}
