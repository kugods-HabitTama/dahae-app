import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dahae_mobile/common/util/route_animation.dart';
import 'package:dahae_mobile/screens/login/view/login_component.dart';
import 'package:dahae_mobile/screens/initial/page/initial_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      // auth가 있으면 바로 habit 아니면 login
      GoRouter.of(context).go('/login');
      //GoRouter.of(context).go('/habit');
    }
        //Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen())),
        );
  }

  @override
  Widget build(BuildContext context) {
    //모든 크기를 screen size에 맞춰서 재정의 필요
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  image: AssetImage('assets/images/logo_3d.png'), height: 150),
              SizedBox(height: 25),
              LoginPageText(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
