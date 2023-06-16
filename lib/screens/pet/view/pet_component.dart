import 'package:dahae_mobile/common/styles/app_colors.dart';
import 'package:dahae_mobile/common/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class PetFooter extends StatefulWidget {
  @override
  _PetFooterState createState() => _PetFooterState();

  // void updateExp() {
  //   setState(() {});
  // }
}

class _PetFooterState extends State<PetFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 252,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PetStats(),
          const SizedBox(height: 6),
          PetActions(),
        ],
      ),
    );
  }
}

/* Pet 애정도, 경험치 stats  */
class PetStats extends StatefulWidget {
  @override
  _PetStatsState createState() => _PetStatsState();
}

class _PetStatsState extends State<PetStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 30),
      decoration: BoxDecoration(
        color: AppColors.highlightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        PercentWrapper(
          flex: 1,
          title: "애정도",
          value: 50,
        ),
        const SizedBox(width: 16),
        PercentWrapper(
          flex: 2,
          title: "경험치",
          value: 100,
        ),
      ]),
    );
  }
}

class PercentWrapper extends StatelessWidget {
  final int flex;
  final String title;
  final int value;

  PercentWrapper(
      {super.key,
      required this.flex,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title,
                textAlign: TextAlign.start, style: AppTextStyle.subTitle10),
            Text("$value %",
                textAlign: TextAlign.center, style: AppTextStyle.pointNumber),
          ],
        ),
      ),
    );
  }
}

/* Pet 상호작용 버튼 Wrapper */
class PetActions extends StatefulWidget {
  @override
  _PetActionsState createState() => _PetActionsState();
}

class _PetActionsState extends State<PetActions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: AppColors.highlightColor,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InteractionWrapper(title: "title"),
            InteractionWrapper(title: "title2"),
            InteractionWrapper(title: "title3"),
            InteractionWrapper(title: "title4"),
            InteractionWrapper(title: "title5"),
          ],
        ),
      ),
    );
  }
}

class InteractionWrapper extends StatelessWidget {
  final String title;

  const InteractionWrapper({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      width: 84,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ActionButton(
            onClick: () {
              debugPrint('Click : $title');
            },
          ),
          const SizedBox(height: 14),
          Text(title, style: AppTextStyle.body1),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onClick;

  const ActionButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        width: 84,
        height: 103,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
