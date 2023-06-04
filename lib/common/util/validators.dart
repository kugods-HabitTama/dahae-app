import 'package:flutter/material.dart';

class Validators {
  static bool isEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // 특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내
  static bool isMixedPassword(String value) {
    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /////////////////////////////////////////////////////////////////////////////

  static String? checkPasswordEmpty(FocusNode focusNode, String val) {
    if (val.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else {
      return null;
    }
  }

  static String? checkValidatePasswordConfirm(
      FocusNode focusNode, String val, String pw) {
    if (val.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호 확인을 입력하세요.';
    } else if (val != pw) {
      focusNode.requestFocus();
      return '비밀번호가 일치하지 않습니다.';
    } else {
      return null;
    }
  }

  static String? checkValidateCertCode(FocusNode focusNode, String val) {
    if (val.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else if (val.length != 6) {
      focusNode.requestFocus();
      return '인증번호는 6자리 숫자 입니다.';
    } else {
      return null;
    }
  }

  static String? checkValidateName(FocusNode focusNode, String val) {
    if (val.isEmpty) {
      focusNode.requestFocus();
      return '닉네임을 입력하세요.';
    } else if (val.length > 8) {
      focusNode.requestFocus();
      return '8자리 이하로 입력하세요.';
    } else {
      return null;
    }
  }
}
