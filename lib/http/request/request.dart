import 'package:attendant/http/handler/handler.dart';
import 'package:attendant/model/Response.dart';

class HttpRequest {
  HttpHandler handler = new HttpHandler();

  Future<Response> setComp(var driver, var circuit,
      var auto, var besTime, var laps) {
    var result =
        handler.compData(driver, circuit, auto, besTime, laps);
    return result;
  }

  Future<Response> getUserLogin(var email, var password) {
    var result = handler.userLogin(email, password);
    return result;
  }

  Future<Response> addDriver(
      var username, var gender, var city, var mobile, var email) {
    var result = handler.addDriver(username, gender, city, mobile, email);
    return result;
  }

  Future<Response> fetchDriver() {
    return handler.fetchDriver();
  }
}
