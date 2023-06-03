import 'package:flutter/material.dart';

// Initial Page ViewModel
abstract class InitialPageViewModel implements Listenable {
  void goLoginPage(BuildContext context);
  void goRegisterPage(BuildContext context);
}
