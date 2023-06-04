import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'register_viewmodel_abs.dart';
import 'package:dahae_mobile/common/util/validators.dart';
import 'package:dahae_mobile/common/util/route_animation.dart';
import 'package:dahae_mobile/data/api/auth_api.dart';
import 'package:dahae_mobile/screens/register/page/register_page_email.dart';
import 'package:dahae_mobile/screens/register/page/register_page_cert.dart';
import 'package:dahae_mobile/screens/register/page/register_page_password.dart';
import 'package:dahae_mobile/screens/register/page/register_page_name.dart';

// Register Viewmodel Implement
class RegisterViewModelImpl with ChangeNotifier implements RegisterViewModel {
  final formKey = GlobalKey<FormState>();
  final certCodeFormKey = GlobalKey<FormState>();
  final emailFormFieldKey = GlobalKey<FormFieldState>();
  final certCodeFormFieldKey = GlobalKey<FormFieldState>();
  final passwordFormFieldKey = GlobalKey<FormFieldState>();
  final passwordConfirmFormFieldKey = GlobalKey<FormFieldState>();
  final nameFormFieldKey = GlobalKey<FormFieldState>();

  final emailFocus = FocusNode();
  final certCodeFocus = FocusNode();
  final passwordFocus = FocusNode();
  final passwordConfirmFocus = FocusNode();
  final nameFocus = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController certCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String _email = '';
  String _certCode = '';
  String _password = '';
  String _name = '';

  bool isDup = false;
  bool isCert = false;

  late final AuthAPI _authAPI;

  RegisterViewModelImpl() {
    _authAPI = AuthAPI();
  }

  printEmail() {
    print(_email);
  }

  setIsDup() {
    isDup = true;
    notifyListeners();
  }

  setIsCert() {
    isCert = true;
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
  String? checkValidateCertCode(FocusNode focusNode, String certCode) {
    if (certCode.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else if (certCode.length != 6) {
      focusNode.requestFocus();
      return '인증번호는 6자리 숫자 입니다.';
    } else {
      return null;
    }
  }

  @override
  String? checkValidatePassword(FocusNode focusNode, String password) {
    if (password.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else if (!Validators.isMixedPassword(password)) {
      focusNode.requestFocus();
      return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요';
    } else {
      return null;
    }
  }

  @override
  String? checkValidatePasswordConfirm(
      FocusNode focusNode, String passwordConfirm) {
    if (passwordConfirm.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호 확인을 입력하세요.';
    } else if (passwordConfirm != _password) {
      focusNode.requestFocus();
      return '비밀번호가 일치하지 않습니다.';
    } else {
      return null;
    }
  }

  @override
  String? checkValidateName(FocusNode focusNode, String name) {
    if (name.isEmpty) {
      focusNode.requestFocus();
      return '닉네임을 입력하세요.';
    } else if (name.length > 8) {
      focusNode.requestFocus();
      return '8자리 이하로 입력하세요.';
    } else {
      return null;
    }
  }

  @override
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  @override
  void setCertCode(String certCode) {
    _certCode = certCode;
    notifyListeners();
  }

  @override
  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  @override
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  @override
  void checkDuplicatedEmail(
      BuildContext context, RegisterViewModelImpl viewModel) {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      // DB로 보내서 맞는지 확인
      if (false) {
        //goHomePage(context);
      } else {
        //setIsWrong();
        goCertPage(context, viewModel);
      }
    }
  }

  @override
  void checkDuplicatedName(
      BuildContext context, RegisterViewModelImpl viewModel) {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      // DB로 보내서 맞는지 확인
      if (false) {
        //goHomePage(context);
      } else {
        // setIsWrong();
      }
    }
  }

  @override
  void register(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      // DB로 보내서 맞는지 확인
      if (false) {
        //goHomePage(context);
      } else {
        //setIsWrong();
      }
    }
  }

  @override
  void goInitialPage(BuildContext context) =>
      GoRouter.of(context).go('/initial');

  @override
  void goMainPage(BuildContext context) => GoRouter.of(context).go('/habit');

  @override
  void goEmailPage(BuildContext context) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(RegisterPage_Email());
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }

  @override
  void goCertPage(BuildContext context, viewModel) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(RegisterPage_Cert(
      viewModel: viewModel,
    ));
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }

  @override
  void goPasswordPage(BuildContext context) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(RegisterPage_Email());
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }

  @override
  void goNamePage(BuildContext context) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(RegisterPage_Email());
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }

  @override
  void navigatorPop(BuildContext context) {}
}
