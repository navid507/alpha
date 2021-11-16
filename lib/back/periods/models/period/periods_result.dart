import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'periods_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class PeriodsResult with _$PeriodsResult{
  const factory PeriodsResult.success(List<Period> periods) = SuccessPeriods;
  const factory PeriodsResult.error(int code, String msg) = ErrorPeriods;
}