import 'package:flutter/material.dart';

// Habit Page ViewModel
abstract class HabitViewModel implements Listenable {
  // 날짜 관련 기능
  void setDateNow();
  void selectDate();

  // 해당 날짜의 habit 가져오기
  void getDatedHabitRecords(selectedDate);

  // 모든 habit 가져오기
  void getAllHabitRecords();

  // view Update
  void updateView();

  // progress update
  void updateProgress();

  // new habit -> add 요청 보내고 success시 get habit 다시함 -> view update
  void addHabit();

  // edit habit -> edit 요청 보내고 successtl get habit 다시함 -> view update
  void editHabit();

  // delete habit -> 마찬가지
  void deleteHabit();

  // habit 설정하는 page 띄우기 -> edit인지 add인지 판단하는 함수 필요
  void openHabitSetting();
}
