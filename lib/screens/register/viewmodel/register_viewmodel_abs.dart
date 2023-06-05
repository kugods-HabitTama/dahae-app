import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';

// Register ViewModel
abstract class RegisterViewModel implements Listenable {
  String? checkValidateEmail(FocusNode focusNode, String email);
  String? checkValidateCertCode(FocusNode focusNode, String certCode);
  String? checkValidatePassword(FocusNode focusNode, String password);
  String? checkValidatePasswordConfirm(
      FocusNode focusNode, String passwordConfirm);
  String? checkValidateName(FocusNode focusNode, String name);

  void setEmail(String email);
  void setCertCode(String certCode);
  void setPassword(String password);
  void setName(String name);

  void checkDuplicatedEmail(
      BuildContext context, RegisterViewModelImpl viewModel);
  void checkDuplicatedName(
      BuildContext context, RegisterViewModelImpl viewModel);

  void register(BuildContext context);

  void goInitialPage(BuildContext context);
  void goEmailPage(BuildContext context);
  void goCertPage(BuildContext context, RegisterViewModelImpl viewModel);
  void goPasswordPage(BuildContext context, RegisterViewModelImpl viewModel);
  void goNamePage(BuildContext context, RegisterViewModelImpl viewModel);
  void goMainPage(BuildContext context);

  void navigatorPop(BuildContext context);
}
