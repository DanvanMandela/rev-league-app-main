class Response {
  bool _error;
  String _message;
  Map _user;
  Map _driver;

  Response(this._error, this._message, this._user, this._driver);

  // ignore: unnecessary_getters_setters
  String get message => _message;

  // ignore: unnecessary_getters_setters
  set message(String value) {
    _message = value;
  }

  // ignore: unnecessary_getters_setters
  bool get error => _error;

  // ignore: unnecessary_getters_setters
  set error(bool value) {
    _error = value;
  }

  // ignore: unnecessary_getters_setters
  Map get user => _user;

  // ignore: unnecessary_getters_setters
  set user(Map value) {
    _user = value;
  }

  // ignore: unnecessary_getters_setters
  Map get driver => _driver;

  // ignore: unnecessary_getters_setters
  set driver(Map value) {
    _driver = value;
  }

  Response.fromResponse(dynamic obj) {
    this._error = obj['error'];
    this._message = obj['message'];
  }

  Response.fromLoginResponse(dynamic obj) {
    this._error = obj['error'];
    this._message = obj['message'];
    this._user = obj['user'];
  }

  Response.fromDriverResponse(dynamic obj) {
    this._error = obj['error'];
    this._message = obj['message'];
    this._driver = obj['player'];
  }
}
