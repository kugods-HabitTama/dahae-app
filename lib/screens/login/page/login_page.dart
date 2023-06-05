import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dahae_mobile/screens/login/viewmodel/login_viewmodel.dart';
import 'package:dahae_mobile/screens/login/view/login_page_scaffold.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late final viewModel = LoginViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return loginPageScaffold();
  }

  Widget loginPageScaffold() {
    return ChangeNotifierProvider<LoginViewModelImpl>.value(
        value: viewModel, child: LoginPageScaffold());
  }
}
