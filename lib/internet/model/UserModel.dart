class User {
  String _username;
  String _password;
  bool  _success;


  User(this._success,this._username, this._password);

  User.map(dynamic obj) {
    this._success = obj["Success"];
    this._username = obj["Message"];
    this._password = obj["Data"];
  }

  String get username => _username;
  String get password => _password;
  bool get success => _success;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Success"] = _success;
    map["Message"] = _username;
    map["Data"] = _password;

    return map;
  }
}