import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Initial Page ViewModel
abstract class InitialPageViewModel implements Listenable {
  void checkCachedAuthToken(BuildContext context);
  void goInitialPage(BuildContext context) {
    GoRouter.of(context).go('/initial');
  }
}
