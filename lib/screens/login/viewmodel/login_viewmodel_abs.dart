import 'package:flutter/material.dart';

// Login ViewModel
abstract class LoginViewModel implements Listenable {
  String? checkValidateEmail(FocusNode focusNode, String email);
  String? checkValidatePassword(FocusNode focusNode, String password);

  void findPassword();

  void login(BuildContext context);
  void googleLogin(BuildContext context);
  void appleLogin(BuildContext context);

  void goMainPage(BuildContext context);
}
