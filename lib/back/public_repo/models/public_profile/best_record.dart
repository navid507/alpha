import 'package:flutter/material.dart';

class RecordTime {
  String min;
  String sec;
  String mil;
  int fullTime;

  int get minutes => int.tryParse(min) ?? 0;
  int get seconds => int.tryParse(sec) ?? 0;
  int get milSeconds => int.tryParse(mil) ?? 0;

  toString() {
    return "$min:$sec.$mil";
    String string = "";
    if (minutes > 0) {
      string += min + "m ";
    }
    if (seconds > 0) {
       string += sec + "s ";
    }
    if (milSeconds > 0) {
      string += mil + "m ";
    }
    return string;
  }

  RecordTime(
      {required this.min,
      required this.sec,
      required this.mil,
      required this.fullTime});
}

class BestRecord {
  String age;

  String styleId;

  String styleName;

  RecordTime time;

  BestRecord(
      {required this.age,
      required this.styleId,
      required this.time,
      required this.styleName});

  factory BestRecord.fromJson(Map<String, dynamic> json) {
    var timeJson = json['time'];
    var time = RecordTime(
        min: timeJson['min'],
        sec: timeJson['sec'],
        mil: timeJson['h_sec'],
        fullTime: timeJson['full']);

    return BestRecord(
        age: json['age'],
        styleId: json['style_id'],
        time: time,
        styleName: json['style_name']);
  }
}
