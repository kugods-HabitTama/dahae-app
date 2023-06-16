import 'package:dahae_mobile/common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dahae_mobile/common/styles/app_text_style.dart';

class PetHeader extends StatelessWidget {
  PetHeader(
      {super.key,
      required this.username,
      required this.petname,
      required this.percentage});

  final String username;
  final String petname;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(17.0),
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 72.0),
          Text('$petname의 애정도 확인하기', style: AppTextStyle.headerTitle14),
          const SizedBox(height: 16.0),
          Text('$username 님,', style: AppTextStyle.headerTitle20),
          const SizedBox(height: 2.0),
          Text('벌써 $petname이와 이만큼 친해졌어요', style: AppTextStyle.headerTitle20),
        ],
      ),
    );
  }
}
