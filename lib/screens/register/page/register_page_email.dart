import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';
import 'package:dahae_mobile/screens/register/view/register_email_scaffold.dart';

class RegisterPage_Email extends StatelessWidget {
  RegisterPage_Email({super.key});

  final _viewModel = RegisterViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return registerPageScaffold();
  }

  Widget registerPageScaffold() {
    return ChangeNotifierProvider<RegisterViewModelImpl>.value(
        value: _viewModel, child: RegisterEmailScaffold());
  }
}
