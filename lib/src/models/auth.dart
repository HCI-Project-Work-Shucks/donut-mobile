import 'dart:ffi';

class Auth {
  int uid;
  Int8 type;
  String password;

  Auth(this.uid, this.type, this.password);

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      json['uid'],
      json['type'],
      json['password']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['type'] = type;
    data['password'] = password;
    return data;
  }
}