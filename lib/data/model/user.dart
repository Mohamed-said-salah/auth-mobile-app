import 'dart:convert';

import 'package:auth_mobile_app/presentation/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class User {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? password;
  String? gender;
  String? image;
  String? token;

  String get fullName => "$firstName $lastName";

  User.toProfileScreen({
    this.image,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.gender,
  });

  User.fromMap(Map<String, dynamic> map) {
    _fromMap(map);
  }
  void _fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
    gender = map['gender'];
    image = map['image'];
    token = map['token'];
  }

  User.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    _fromMap(map);
  }

  Future<bool> toDB() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', id ?? "empty value");
      await prefs.setString('firstName', firstName ?? "empty value");
      await prefs.setString('lastName', lastName ?? "empty value");
      await prefs.setString('username', username ?? "empty value");
      await prefs.setString('email', email ?? "empty value");
      await prefs.setString('password', password ?? "empty value");
      await prefs.setString('gender', gender ?? "empty value");
      await prefs.setString('image', image ?? "empty value");
      await prefs.setString('token', token ?? "empty value");
      await prefs.setBool('loggedIn', true);
      ProfileScreen.userInfo = User.toProfileScreen(
        image: image,
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        gender: gender,
      );
    } catch (e) {
      print('Problem Caching Data');
      return false;
    }
    return true;
  }

  User.fromDB() {
    _fromDB();
  }
  _fromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
    firstName = prefs.getString("firstName");
    lastName = prefs.getString("lastName");
    username = prefs.getString("userName");
    email = prefs.getString("email");
    password = prefs.getString("password");
    gender = prefs.getString("gender");
    image = prefs.getString("image");
    token = prefs.getString("token");
  }
}
