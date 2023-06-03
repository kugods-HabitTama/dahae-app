import 'package:flutter/material.dart';

// Login Viewmodel
abstract class LoginViewModel implements Listenable {
  String get id;
  String get pw;

  set loginID(String value);
  set loginPw(String value);

  bool get enableLoginButton;

  Future login(BuildContext context);
}
