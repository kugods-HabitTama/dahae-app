import 'package:flutter/material.dart';

import 'package:dahae_mobile/screens/register/view/login_component.dart';
import 'package:dahae_mobile/screens/register/viewmodel/register_viewmodel.dart';

class RegisterPasswordScaffold extends StatelessWidget {
  const RegisterPasswordScaffold({super.key, required this.viewModel});

  final RegisterViewModelImpl viewModel;

  @override
  Widget build(BuildContext context) {
    //WARNING MESSAGE
    Center differentPassword = const Center(
      child: Text('비밀번호가 일치하지 않습니다',
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
          SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? MediaQuery.of(context).size.height * 0.17
                  : MediaQuery.of(context).size.height * 0.1),
          const Image(
              image: AssetImage('assets/images/logo_3d.png'), height: 130),
          const SizedBox(height: 25),
          const SignUpText(text: '비밀번호를'),
          SizedBox(
              height: 30,
              child: !viewModel.isNotConfirm ? differentPassword : Container()),
          SignUpInputTextBox(
            label: '비밀번호',
            password: true,
            focusNode: viewModel.passwordFocus,
            onChanged: (val) {
              viewModel.setPassword(val);
            },
            onSaved: (val) {},
            validator: (val) =>
                viewModel.checkValidatePassword(viewModel.passwordFocus, val),
          ),
          const SizedBox(height: 10),
          SignUpInputTextBox(
            label: '비밀번호 확인',
            password: true,
            focusNode: viewModel.passwordConfirmFocus,
            onChanged: (val) {},
            onSaved: (val) {},
            validator: (val) => viewModel.checkValidatePasswordConfirm(
                viewModel.passwordConfirmFocus, val),
            // {if (val.length < 1) return '비밀번호 확인을 입력하세요.';
            //   return null;},
          ),
          const SizedBox(height: 70),
        ],
      ),
    );

    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '이걸로 하기',
      onPressed: () async {
        viewModel.printEmail();
        viewModel.printCertCode();
        viewModel.printPW();
        viewModel.goNamePage(context, viewModel);
      },
    );

    return Form(
      key: viewModel.passwordFormKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SignUpAppBar()),
        extendBodyBehindAppBar: true,
        body: screenBody,
        bottomSheet: bottomButton,
      ),
    );
  }
}
