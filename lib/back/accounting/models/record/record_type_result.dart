
import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'record_type_result.freezed.dart';
// part 'period_result.g.dart';

@freezed
class RecordTypesResult with _$RecordTypesResult{
  const factory RecordTypesResult.success(List<RecordType> recordTypes) = SuccessRecordTypes;
  const factory RecordTypesResult.error(int code, String msg) = ErrorRecordTypes;
}

