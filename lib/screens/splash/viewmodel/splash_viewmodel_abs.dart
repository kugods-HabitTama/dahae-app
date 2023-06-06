import 'package:flutter/material.dart';

// Splash Page ViewModel
abstract class SplashPageViewModel implements Listenable {
  void checkCachedAuthToken(BuildContext context);
  void goInitialPage(BuildContext context);
  void goMainPage(BuildContext context);
}
