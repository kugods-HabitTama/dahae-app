import 'package:flutter/material.dart';
import 'nav_bar.dart';

// 메인 화면 감싸는 위젯
// 간단하게 Scaffold에 NavBar만 사용.
// NavBar에서 해빗, 다마고치, 프로필 창 오갈 수 있도록 함
class HomeScaffold extends StatelessWidget {
  final Widget child;

  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const NavBar(),
    );
  }
}
