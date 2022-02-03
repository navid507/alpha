import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'medical.freezed.dart';

@freezed
class Medical with _$Medical {
  factory Medical(
      {required int id,
      required String date,
      required String time,
      required String name,
       required String description}) = _Medical;

  factory Medical.fromJson(Map<String, dynamic> json) {
    return Medical(
        id: json['id'],
        date: json['date'],
        time: json['time'],
        name: json['name'],
        description: json['description']);
  }
}
