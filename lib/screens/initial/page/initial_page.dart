import 'package:flutter/material.dart';

import 'package:dahae_mobile/common/util/route_animation.dart';
import 'package:dahae_mobile/screens/login/login_component.dart';
import 'package:dahae_mobile/screens/login/login_screen.dart';
import 'package:dahae_mobile/screens/register/register_email.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/logo_3d.png'), height: 150),
              const SizedBox(height: 25),
              const LoginPageText(),
              const SizedBox(height: 70),
              DahaeStartButton(
                child: Text('처음 다 해 봐요!'),
                onPressed: () {
                  PageRouteWithAnimation pageRouteWithAnimation =
                      PageRouteWithAnimation(RegisterPage_Email());
                  Navigator.push(
                      context, pageRouteWithAnimation.slideRitghtToLeft());
                },
              ),
              const SizedBox(height: 20),
              DahaeStartButton(
                child: Text('다 해 본 적 있어요'),
                onPressed: () {
                  PageRouteWithAnimation pageRouteWithAnimation =
                      PageRouteWithAnimation(LoginScreen());
                  Navigator.push(
                      context, pageRouteWithAnimation.slideRitghtToLeft());
                  //MaterialPageRoute(
                  //builder: (_) => SignInScreen(),),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
