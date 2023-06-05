import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/login_component.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterNameScaffold extends StatelessWidget {
  const RegisterNameScaffold({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center duplicateName = const Center(
      child: Text('중복된 닉네임입니다.',
          style: TextStyle(
              color: Color(0xFFFA0000),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );

    SingleChildScrollView screenBody = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          const SignUpText(text: '닉네임을'),
          SizedBox(
              height: 30,
              child: viewModel.isNameDup ? duplicateName : Container()),
          SignUpInputTextBox(
            label: '닉네임',
            focusNode: viewModel.nameFocus,
            onSaved: (val) {},
            onChanged: (val) {
              viewModel.setName(val);
            },
            validator: (val) =>
                viewModel.checkValidateName(viewModel.nameFocus, val),
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '이걸로 하기',
      onPressed: () async {
        viewModel.printEmail();
        viewModel.printCertCode();
        viewModel.printPW();
        viewModel.printName();
        viewModel.goMainPage(context);
      },
    );

    return Form(
      key: viewModel.nameFormKey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SignUpAppBar()),
          extendBodyBehindAppBar: true,
          body: screenBody,
          bottomSheet: bottomButton),
    );
  }
}
