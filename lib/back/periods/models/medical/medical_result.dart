import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'medical.dart';


part 'medical_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class MedicalsResult with _$MedicalsResult{
  const factory MedicalsResult.success(List<Medical> medicalsSessions) = SuccessMedicals;
  const factory MedicalsResult.error(int code, String msg) = ErrorMedicals;
}