import 'package:flutter/material.dart';

import 'login_viewmodel_abs.dart';

// Login Viewmodel Implement
class LoginViewModelImpl with ChangeNotifier implements LoginViewModel {
  String _id = '';
  String _pw = '';

  @override
  String get id => _id;

  @override
  String get pw => _pw;

  @override
  set loginID(String value) {
    if (_isValidUserId(value)) {
      _id = value;
      notifyListeners();
    }
  }

  @override
  set loginPw(String value) {
    if (_isValidUserPw(value)) {
      _pw = value;
      notifyListeners();
    }
  }

  @override
  bool get enableLoginButton => _id.isNotEmpty && _pw.isNotEmpty;

  @override
  Future<void> login(BuildContext context) async {}
  // validator
  bool _isValidUserId(String value) => true;
  bool _isValidUserPw(String value) => value.length >= 5;
}
