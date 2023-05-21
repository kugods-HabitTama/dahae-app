import 'package:flutter/material.dart';

class DayButtons extends StatefulWidget {
  final List<bool> isSelected;

  const DayButtons({super.key, required this.isSelected});

  @override
  State<DayButtons> createState() => _DayButtonsState();
}

class _DayButtonsState extends State<DayButtons> {
  List<String> weekdays = ["월", "화", "수", "목", "금", "토", "일"];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(
      //   top: 5,
      //   bottom: 5,
      // ),
      child: ToggleButtons(
        renderBorder: false,
        onPressed: (int index) {
          // All buttons are selectable.
          setState(() {
            widget.isSelected[index] = !widget.isSelected[index];
            //print(widget.isSelected);
          });
        },
        constraints: const BoxConstraints(
          maxWidth: 320,
        ),
        isSelected: widget.isSelected,
        selectedBorderColor: Colors.transparent,
        selectedColor: Colors.transparent,
        fillColor: Colors.transparent,
        splashColor: Colors.transparent,
        children: List<Widget>.generate(
          7,
          (index) => Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.isSelected[index]
                    ? Theme.of(context).focusColor
                    : Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(18),
              ),
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: Text(
                weekdays[index],
                style: widget.isSelected[index]
                    ? const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700)
                    : TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        // disabledColor: ,
        // color: Colors.black,
        // constraints: const BoxConstraints(
        //   minHeight: 40.0,
        //   minWidth: 20.0,
        // ),
        // isSelected: _isSelected,
        // //children: days,
      ),
    );
  }
}
