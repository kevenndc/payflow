import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/models/user.dart';

class AuthController {
  bool _isAuthenticated = false;
  User? _user;

  User get user => _user!;

  void setUser(BuildContext context, User? user) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(
          context, "/home"
      );
      return;
    }
    _user = null;
    _isAuthenticated = false;
    Navigator.pushReplacementNamed(
      context, "/login"
    );
  }

  Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString("user", user.toJson());
  }

  Future<void> hasUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;
    setUser(context, User.fromJson(json));
  }
}
