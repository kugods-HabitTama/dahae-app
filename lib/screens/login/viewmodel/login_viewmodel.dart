import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_viewmodel_abs.dart';
import 'package:dahae_mobile/common/util/validators.dart';
import 'package:dahae_mobile/data/api/auth_api.dart';

// Login Viewmodel Implement
class LoginViewModelImpl with ChangeNotifier implements LoginViewModel {
  final formKey = GlobalKey<FormState>();
  final emailFormFieldKey = GlobalKey<FormFieldState>();
  final passwordFormFieldKey = GlobalKey<FormFieldState>();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isWrong = false;

  late final AuthAPI _authAPI;

  LoginViewModelImpl() {
    _authAPI = AuthAPI();
  }

  setIsWrong() {
    isWrong = true;
    notifyListeners();
  }

  @override
  String? checkValidateEmail(FocusNode focusNode, String email) {
    if (email.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    } else if (!Validators.isEmail(email)) {
      //포커스를 해당 textformfield에 맞춘다.
      focusNode.requestFocus();
      return '잘못된 이메일 형식입니다.';
    } else {
      return null;
    }
  }

  @override
  String? checkValidatePassword(FocusNode focusNode, String password) {
    if (password.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else {
      return null;
    }
  }

  @override
  void findPassword() {}

  @override
  void login(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      // DB로 보내서 맞는지 확인
      if (false) {
        //goHomePage(context);
      } else {
        setIsWrong();
      }
    }
  }

  void googleLogin(BuildContext context) {}
  void appleLogin(BuildContext context) {}

  @override
  void goMainPage(BuildContext context) {
    GoRouter.of(context).go('/habit');
  }
}
