import 'package:ImpalaAdmin/Models/Authentication/AspNetUser.dart';
import 'dart:core';

class UserAuthentication {
  AspNetUser user;
  String email;
  String password;
  String key;
  bool active;

  UserAuthentication(
      {this.user, this.email, this.password, this.key, this.active});

  UserAuthentication.fromJson(Map<String, dynamic> json)
      : user = json['User'],
        email = json['Email'],
        password = json['Password'],
        key = json['Key'],
        active = json['Active'];

  Map<String, dynamic> toJson() {
    return {
      'User': user,
      'Email': email,
      'Password': password,
      'Key': key,
      'Active': active
    };
  }
}
