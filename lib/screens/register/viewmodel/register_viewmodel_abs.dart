import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';

// Register ViewModel
abstract class RegisterViewModel implements Listenable {
  // 각 단계의 validator
  String? checkValidateEmail(FocusNode focusNode, String email);
  String? checkValidateCertCode(FocusNode focusNode, String certCode);
  String? checkValidatePassword(FocusNode focusNode, String password);
  String? checkValidatePasswordConfirm(
      FocusNode focusNode, String passwordConfirm);
  String? checkValidateName(FocusNode focusNode, String name);

  // 입력받은 data 저장
  void setEmail(String email);
  void setCertCode(String certCode);
  void setPassword(String password);
  void setName(String name);

  // 중복된 email 혹은 닉네임인지 API로 확인
  void checkDuplicatedEmail(
      BuildContext context, RegisterViewModelImpl viewModel);
  void checkDuplicatedName(
      BuildContext context, RegisterViewModelImpl viewModel);

  // 서버에 register 요청 보냄
  void register(BuildContext context);

  // Navigator
  void goMainPage(BuildContext context);
  void goInitialPage(BuildContext context);
  void goEmailPage(BuildContext context);
  void goCertPage(BuildContext context, RegisterViewModelImpl viewModel);
  void goPasswordPage(BuildContext context, RegisterViewModelImpl viewModel);
  void goNamePage(BuildContext context, RegisterViewModelImpl viewModel);

  void navigatorPop(BuildContext context);
}
