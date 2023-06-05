import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/login_component.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterCertScaffold extends StatelessWidget {
  const RegisterCertScaffold({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center worngCertification = const Center(
      child: Text('인증번호가 일치하지 않습니다',
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          const SignUpText(text: '인증번호를', auth: true),
          SizedBox(
              height: 30,
              child: viewModel.isNotCert ? worngCertification : Container()),
          SignUpInputTextBox(
            label: '인증번호',
            focusNode: viewModel.certCodeFocus,
            isNum: true,
            reSend: true,
            onSaved: (val) {},
            onChanged: (val) {
              viewModel.setCertCode(val);
            },
            validator: (val) {},
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '인증하기',
      onPressed: () async {
        viewModel.printEmail();
        viewModel.goPasswordPage(context, viewModel);
      },
    );

    return Form(
      key: viewModel.certCodeFormKey,
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
