import 'package:flutter/material.dart';

import 'initial_page_viewmodel_abs.dart';
import 'package:dahae_mobile/common/util/route_animation.dart';
import 'package:dahae_mobile/screens/login/page/login_page.dart';
import 'package:dahae_mobile/screens/register/page/register_page_email.dart';

class InitialPageViewModelImpl
    with ChangeNotifier
    implements InitialPageViewModel {
  @override
  void goLoginPage(BuildContext context) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(LoginPage());
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }

  @override
  void goRegisterPage(BuildContext context) {
    PageRouteWithAnimation pageRouteWithAnimation =
        PageRouteWithAnimation(RegisterPage_Email());
    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
  }
}
