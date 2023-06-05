import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'splash_viewmodel_abs.dart';

class SplashViewModelImpl with ChangeNotifier implements SplashPageViewModel {
  @override
  void checkCachedAuthToken(BuildContext context) {}

  @override
  void goInitialPage(BuildContext context) {
    GoRouter.of(context).go('/initial');
  }

  @override
  void goMainPage(BuildContext context) {
    GoRouter.of(context).go('/habit');
  }
}
