import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/register_cert_scaffold.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterPage_Cert extends StatelessWidget {
  const RegisterPage_Cert({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    return RegisterCertScaffold(viewModel: viewModel);
  }
}
