import 'package:alpha/back/periods/models/period/period.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'period_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class PeriodResult with _$PeriodResult{
  const factory PeriodResult.success(Period period) = SuccessPeriod;
  const factory PeriodResult.error(int code, String msg) = ErrorPeriod;
}