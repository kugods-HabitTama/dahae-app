import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/register_name_scaffold.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterPage_Name extends StatelessWidget {
  const RegisterPage_Name({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    return RegisterNameScaffold(viewModel: viewModel);
  }
}
