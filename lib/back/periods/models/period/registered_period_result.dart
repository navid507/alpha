import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registered_period_result.freezed.dart';

@freezed
class RegisteredPeriodResult with _$RegisteredPeriodResult {
  const factory RegisteredPeriodResult.success(RegisteredPeriod period) =
      SuccessRegisteredPeriod;

  const factory RegisteredPeriodResult.error(int code, String msg) =
      ErrorRegisteredPeriod;
}
