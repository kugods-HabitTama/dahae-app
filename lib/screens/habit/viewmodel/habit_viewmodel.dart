import 'package:flutter/material.dart';

import 'package:dahae_mobile/data/models/habit.dart';
import 'package:dahae_mobile/data/models/habit_record.dart';
import 'habit_viewmodel_abs.dart';

class HabitViewModelImpl with ChangeNotifier implements HabitViewModel {
  List<Habit> allHabits = [];
  List<HabitRecord> datedHabitRecords = [];

  final addHabitFormKey = GlobalKey<FormState>();
  final editHabitFormKey = GlobalKey<FormState>();
  final progressFormKey = GlobalKey<FormState>();

  TextEditingController addHabitController = TextEditingController();
  TextEditingController editHabitController = TextEditingController();
  TextEditingController progressController = TextEditingController();

  DateTime dateNow = DateTime.now();
  late DateTime selectedDate;

  @override
  void setDateNow() {
    dateNow = DateTime.now();
    selectedDate = dateNow;
  }

  @override
  void selectDate() {}

  // 해당 날짜의 habit 가져오기
  @override
  void getDatedHabitRecords(selectedDate) {}

  // 모든 habit 가져오기
  @override
  void getAllHabitRecords() {}

  // view Update
  @override
  void updateView() {
    notifyListeners();
  }

  // progress update
  @override
  void updateProgress() {}

  // new habit -> add 요청 보내고 success시 get habit 다시함 -> view update
  @override
  void addHabit() {}

  // edit habit -> edit 요청 보내고 successtl get habit 다시함 -> view update
  @override
  void editHabit() {}

  // delete habit -> 마찬가지
  @override
  void deleteHabit() {}

  // habit 설정하는 page 띄우기 -> edit인지 add인지 판단하는 함수 필요
  @override
  void openHabitSetting() {}
}
