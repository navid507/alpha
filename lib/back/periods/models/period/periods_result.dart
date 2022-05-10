import 'package:alpha/back/periods/models/period/period.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'periods_result.freezed.dart';

@freezed
class PeriodsResult with _$PeriodsResult{
  const factory PeriodsResult.success(List<Period> periods) = SuccessPeriods;
  const factory PeriodsResult.error(int code, String msg) = ErrorPeriods;
}