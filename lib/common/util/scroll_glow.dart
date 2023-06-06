import 'package:flutter/material.dart';

// 기본적으로 SingleChildScrollView에서 파란색으로 빛나는 것 없애기 위한 코드
class DiableScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
