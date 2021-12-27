import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';

class SnowViewModel extends ChangeNotifier {
  ClockModel model;
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  SnowViewModel(this.model);

  void startListener() {
    updateTimeToView();
  }

  String get hour =>
      DateFormat(model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
  String get minute => DateFormat(DateFormat.MINUTE).format(_dateTime);
  String get second => DateFormat(DateFormat.SECOND).format(_dateTime);

  int get secondValue => int.parse(second);

  bool get hohoPoligon {
    int val = (secondValue ~/ 10);
    return (val % 2 == 1 ? false : true);
  }

  // bool get

  void updateTimeToView() {
    _dateTime = DateTime.now();
    _timer = Timer(
      Duration(seconds: 1),
      updateTimeToView,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
