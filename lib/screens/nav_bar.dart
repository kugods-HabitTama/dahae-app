import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HabitNavBar extends StatefulWidget {
  const HabitNavBar({super.key});

  @override
  State<HabitNavBar> createState() => _HabitNavBarState();
}

class _HabitNavBarState extends State<HabitNavBar> {
  int _menu = 0;

  @override
  Widget build(BuildContext context) {
    var calendar_icon = (_menu == 0)
        ? Image.asset("assets/icons/calendar_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/calendar.png", width: 30, height: 30);

    var pet_icon = (_menu == 1)
        ? Image.asset("assets/icons/pet_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/pet.png", width: 30, height: 30);

    var profile_icon = (_menu == 2)
        ? Image.asset("assets/icons/profile_act.png", width: 30, height: 30)
        : Image.asset("assets/icons/profile.png", width: 30, height: 30);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: (() {
              _menu = 0;
              GoRouter.of(context).go('/habit');
            }),
            icon: calendar_icon,
            enableFeedback: false,
          ),
          IconButton(
            onPressed: (() {
              _menu = 1;
              GoRouter.of(context).go('/pet');
            }),
            icon: pet_icon,
            enableFeedback: false,
          ),
          IconButton(
            onPressed: (() {
              _menu = 2;
              GoRouter.of(context).go('/profile');
            }),
            icon: profile_icon,
            enableFeedback: false,
          ),
        ],
      ),
    );
  }
}
