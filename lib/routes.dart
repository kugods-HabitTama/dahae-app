import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/screens.dart';
import 'package:dahae_mobile/screens/nav_bar.dart';

class AppRouter {
  static GoRouter get router => _router;

  // ShellRoute를 위한 Key설정
  static final GlobalKey<NavigatorState> _rootkey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homekey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootkey,
    initialLocation: '/habit',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/habit',
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/initial',
        builder: (context, state) {
          return InitialScreen();
        },
      ),
      GoRoute(
        path: '/habit',
        redirect: (_, __) {
          var now = DateTime.now();
          return '/habit/${now.year}/${now.month}/${now.day}';
        },
      ),
      ShellRoute(
        navigatorKey: _homekey,
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const HabitNavBar(),
          );
        },
        routes: [
          GoRoute(
            path: '/habit/:year(\\d+)/:month(\\d+)/:day(\\d+)',
            builder: (context, state) => HabitPage(
              selectedDate: DateTime(
                int.parse(state.params['year']!),
                int.parse(state.params['month']!),
                int.parse(state.params['day']!),
              ),
            ),
          ),
          GoRoute(
            path: '/pet',
            builder: (context, state) => PetPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => ProfilePage(),
          ),
        ],
      )
    ],
  );
}
