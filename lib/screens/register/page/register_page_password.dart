import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/register_password_scaffold.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterPage_Password extends StatelessWidget {
  const RegisterPage_Password({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    return RegisterPasswordScaffold(viewModel: viewModel);
  }
}
