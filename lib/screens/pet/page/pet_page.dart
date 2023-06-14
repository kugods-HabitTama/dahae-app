import 'package:dahae_mobile/common/styles/app_colors.dart';
import 'package:dahae_mobile/screens/pet/view/pet_component.dart';
import 'package:flutter/material.dart';

import '../view/pet_header.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // mockData
    String userName = 'Yeeun';
    String petName = '도담';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          PetHeader(username: userName, petname: petName, percentage: 80),
          Expanded(
            child: Center(
              child: Image.asset('assets/images/pet_running.gif',
                  width: 186, height: 290),
            ),
          ),
          PetFooter(),
        ],
      ),
    );
  }
}
