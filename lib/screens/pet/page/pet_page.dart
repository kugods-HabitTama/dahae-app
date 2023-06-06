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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          PetHeader(),
          Expanded(
              child: Center(
            child:
                Image.asset('assets/images/sorry.png', width: 200, height: 400),
          )),
          PetBanner(),
        ],
      ),
    );
  }
}
