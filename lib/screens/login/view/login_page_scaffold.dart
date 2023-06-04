import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_component.dart';
import 'package:dahae_mobile/screens/login/viewmodel/login_viewmodel.dart';

class LoginPageScaffold extends StatelessWidget {
  const LoginPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModelImpl>(context);
    return _loginPageScaffold(viewModel, context);
  }

  Widget _loginPageScaffold(viewModel, context) {
    //WARNING MESSAGE
    Center wrongAccountMsg = const Center(
      child: Text('잘 못 입력하셨습니다.',
          style: TextStyle(
              color: Color(0xFFFA0000),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );
    // screen Body
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
          LoginPageText(),
          SizedBox(
            height: 30,
            //child: viewModel.isWrong ? wrongAccountMsg : Container(),
          ),
          SignUpInputTextBox(
            label: '이메일',
            focusNode: viewModel.emailFocus,
            onSaved: (val) {},
            onChanged: (val) {},
            validator: (val) =>
                viewModel.checkValidateEmail(viewModel.emailFocus, val),
          ),
          const SizedBox(height: 10),
          SignUpInputTextBox(
            label: '비밀번호',
            password: true,
            nopad: true,
            focusNode: viewModel.passwordFocus,
            onSaved: (val) {},
            onChanged: (val) {},
            validator: (val) =>
                viewModel.checkValidatePassword(viewModel.passwordFocus, val),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 250,
                child: viewModel.isWrong
                    ? Text('사용자 정보가 올바르지 않습니다.')
                    : Container(),
              ),
              GestureDetector(
                onTap: () => viewModel.findPassword(),
                child: Text(
                  '비밀번호가 생각나지 않아요',
                  style: TextStyle(fontSize: 9),
                ),
              ),
              SizedBox(height: 30, width: 30),
            ],
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
    SignUpBottomButton bottomButton = SignUpBottomButton(
      text: '로그인',
      onPressed: () async {
        viewModel.login(context);
      },
    );
    return Form(
      key: viewModel.formKey,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SignUpAppBar()),
        extendBodyBehindAppBar: true,
        body: screenBody,
        // sign in button
        bottomSheet: bottomButton,
      ),
    );
  }
}
