import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_component.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterEmailScaffold extends StatelessWidget {
  const RegisterEmailScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<RegisterViewModelImpl>(context);
    return _registerEmailScaffold(viewModel, context);
  }

  Widget _registerEmailScaffold(viewModel, context) {
    //WARNING MESSAGE
    Center duplicateEmail = const Center(
      child: Text('중복된 이메일입니다.',
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
          SignUpText(text: viewModel.isEmailDup ? '이메일을 다시' : '이메일을'),
          SizedBox(
              height: 30,
              child: viewModel.isEmailDup ? duplicateEmail : Container()),
          SignUpInputTextBox(
            label: '이메일',
            focusNode: viewModel.emailFocus,
            onSaved: (val) {},
            onChanged: (val) {
              viewModel.setEmail(val);
            },
            validator: (val) =>
                viewModel.checkValidateEmail(viewModel.emailFocus, val),
          ),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '인증번호 받기',
      onPressed: () async {
        viewModel.printEmail();
        viewModel.checkDuplicatedEmail(context, viewModel);
      },
    );

    return Form(
      key: viewModel.emailFormKey,
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
